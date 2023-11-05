package endpoints

import (
	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
)

var validate = validator.New()

func RegisterEndpoints(router fiber.Router) {
	setupUsersEndpoints(router)
}
