package endpoints

import (
	"go-fiber-bun/internal/services/users"
	"net/http"
	"slices"

	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
)

func setupUsersEndpoints(router fiber.Router) {
	router.Get("/user", findUsers)
}

type FindUsersDto struct {
	Include []string `query:"include" validate:"unique,dive,oneof=contacts notes"`
}

func (dto *FindUsersDto) toFindUsersOptions() *users.FindUsersOptions {
	return &users.FindUsersOptions{
		IncludeContacts: slices.Contains(dto.Include, "contacts"),
		IncludeNotes:    slices.Contains(dto.Include, "notes"),
	}
}

func findUsers(c *fiber.Ctx) error {
	var dto FindUsersDto
	if err := c.QueryParser(&dto); err != nil {
		return err
	}

	if errs := validate.Struct(dto); errs != nil && len(errs.(validator.ValidationErrors)) > 0 {
		return c.SendStatus(http.StatusUnprocessableEntity)
	}

	users, err := users.FindAll(dto.toFindUsersOptions())
	if err != nil {
		return err
	}

	return c.JSON(users)
}
