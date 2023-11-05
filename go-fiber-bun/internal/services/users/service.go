package users

import (
	"context"
	"go-fiber-bun/internal/database"
	"go-fiber-bun/internal/database/models"
	"time"

	"github.com/cockroachdb/errors"
)

type FindUsersOptions struct {
	IncludeContacts bool
	IncludeNotes    bool
}

func FindAll(options *FindUsersOptions) ([]*models.Users, error) {
	var users []*models.Users
	query := database.DB().NewSelect().Model(&users).Order("username")

	if options.IncludeContacts {
		query = query.Relation("Contacts")
	}

	if options.IncludeNotes {
		query = query.Relation("Notes")
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	if err := query.Scan(ctx); err != nil {
		return nil, errors.Wrap(err, "failed to find users")
	}

	return users, nil
}
