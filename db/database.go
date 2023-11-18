package db

import (
	"database/sql"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strconv"
	"strings"

	"github.com/jmoiron/sqlx"
)

func migrate(db *sql.DB, migrations string) error {
	files, err := os.ReadDir(migrations)
	if err != nil {
		return err
	}

	// Sort files by name
	sort.Slice(files, func(i, j int) bool {
		fileI := strings.Split(strings.TrimSuffix(files[i].Name(), ".sql"), "_")
		fileJ := strings.Split(strings.TrimSuffix(files[j].Name(), ".sql"), "_")
		valI, _ := strconv.Atoi(fileI[len(fileI)-1])
		valJ, _ := strconv.Atoi(fileJ[len(fileJ)-1])
		return valI < valJ
	})

	for _, file := range files {
		if filepath.Ext(file.Name()) == ".sql" {
			err = executeSQLFile(db, filepath.Join(migrations, file.Name()))
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func executeSQLFile(db *sql.DB, filePath string) error {
	contents, err := os.ReadFile(filePath)
	if err != nil {
		return err
	}

	_, err = db.Exec(string(contents))
	if err != nil {
		return err
	}

	return nil
}

func GetSqliteDatabase(name, migrations string) (*sqlx.DB, error) {
	db, err := sql.Open("sqlite3", fmt.Sprintf("file:%s?cache=shared&mode=rwc", name))
	if err != nil {
		return nil, err
	}

	if err = db.Ping(); err != nil {
		return nil, err
	}

	err = migrate(db, migrations)

	return sqlx.NewDb(db, "sqlite3"), nil
}
