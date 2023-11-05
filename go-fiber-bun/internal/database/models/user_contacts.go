package models

import (
	"time"

	"github.com/uptrace/bun"
)

type UserContacts struct {
	bun.BaseModel `bun:"user_contacts"`

	Id     int    `bun:",pk,autoincrement" json:"id"`
	UserId int    `json:"userId"`
	Name   string `json:"name"`
	Email  string `json:"email"`

	CreatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"createdAt"`
	UpdatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"updatedAt"`
	DeletedAt *time.Time `bun:",soft_delete,nullzero" json:"deletedAt,omitempty"`
}
