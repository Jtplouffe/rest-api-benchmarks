package main

import (
	"go-fiber-bun/internal/database"
	"go-fiber-bun/internal/endpoints"

	"github.com/cockroachdb/errors"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
)

func main() {
	if err := database.Init(); err != nil {
		err = errors.Wrap(err, "failed to initialize database")
		panic(err)
	}

	router := fiber.New()
	router.Use(logger.New())
	endpoints.RegisterEndpoints(router)

	if err := router.Listen("0.0.0.0:8080"); err != nil {
		panic(err)
	}
}
