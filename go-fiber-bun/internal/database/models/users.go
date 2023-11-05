package models

import (
	"time"

	"github.com/uptrace/bun"
)

var UsersModel = (*Users)(nil)

type Users struct {
	bun.BaseModel `bun:"users"`

	Id       int    `bun:",pk,autoincrement" json:"id"`
	Username string `json:"username"`
	Email    string `json:"email"`

	CreatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"createdAt"`
	UpdatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"updatedAt"`
	DeletedAt *time.Time `bun:",soft_delete,nullzero" json:"deletedAt,omitempty"`

	Contacts []*UserContacts `bun:"rel:has-many,join:id=user_id" json:"contacts,omitempty"`
	Notes    []*UserNotes    `bun:"rel:has-many,join:id=user_id" json:"notes,omitempty"`
}
