package render

import (
	"io"

	"github.com/a-h/templ"
	"github.com/labstack/echo/v4"
)

type Template struct {
}

func (t *Template) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
	component := data.(templ.Component)
	return component.Render(c.Request().Context(), w)
}
