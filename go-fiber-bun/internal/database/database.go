package database

import (
	"database/sql"

	"github.com/cockroachdb/errors"
	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/driver/pgdriver"
)

var db *bun.DB

func Init() error {
	dsn := "postgres://root:root@host.docker.internal/rest_api_benchmarks?sslmode=disable"
	sqlDb := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))

	if err := sqlDb.Ping(); err != nil {
		return errors.Wrap(err, "failed to ping database")
	}

	db = bun.NewDB(sqlDb, pgdialect.New())
	// Disable logging when benchmarking
	// db.AddQueryHook(bundebug.NewQueryHook(bundebug.WithVerbose(true)))

	return nil
}

func DB() *bun.DB {
	return db
}
