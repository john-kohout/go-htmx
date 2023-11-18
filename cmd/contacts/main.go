package main

//go:generate go get -u github.com/valyala/quicktemplate/qtc
//go:generate qtc -dir=../web/templates

import (
	"fmt"
	"time"

	"github.com/labstack/echo/v4"
	_ "github.com/mattn/go-sqlite3"

	"github.com/kelseyhightower/envconfig"
	"github.com/labstack/echo/v4/middleware"
	"github.com/rs/zerolog/log"

	"github.com/john-kohout/go-htmx/db"
	"github.com/john-kohout/go-htmx/internal/contacts"
	pkg "github.com/john-kohout/go-htmx/pkg/contacts"
	"github.com/john-kohout/go-htmx/pkg/render"
)

type Config struct {
	BasePath   string `envconfig:"BASEPATH" default:""`
	Database   string `envconfig:"DATABASE" default:"../../db/database.db"`
	Migrations string `envconfig:"MIGRATIONS" default:"../../db/migrations"`
	Port       int    `envconfig:"PORT" default:"8000"`
	Timeout    int    `envconfig:"TIMEOUT" default:"5"`
}

func main() {
	cfg := Config{}
	err := envconfig.Process("contacts", &cfg)
	if err != nil {
		log.Fatal().Err(err).Send()
	}

	database, err := db.GetSqliteDatabase(cfg.Database, cfg.Migrations)
	if err != nil {
		log.Fatal().Err(err).Send()
	}

	s := contacts.NewServer(
		pkg.NewService(
			database,
			pkg.SqliteRepository{},
		),
	)
	e := echo.New()
	e.Use(
		middleware.TimeoutWithConfig(middleware.TimeoutConfig{
			Skipper: middleware.DefaultSkipper,
			Timeout: time.Duration(cfg.Timeout) * time.Second,
		}),
		middleware.Logger(),
		middleware.Recover(),
	)
	e.Renderer = &render.Template{}
	e.Static("/static", "../../web/static")

	contacts.RegisterHandlersWithBaseURL(e, s, cfg.BasePath)
	err = e.Start(fmt.Sprintf(":%d", cfg.Port))
	if err != nil {
		log.Fatal().Err(err).Send()
	}
}
