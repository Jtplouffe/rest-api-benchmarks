package models

import (
	"time"

	"github.com/uptrace/bun"
)

type UserNotes struct {
	bun.BaseModel `bun:"user_notes"`

	Id      int    `bun:",pk,autoincrement" json:"id"`
	UserId  int    `json:"userId"`
	Title   string `json:"title"`
	Content string `json:"content"`

	CreatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"createdAt"`
	UpdatedAt time.Time  `bun:",nullzero,notnull,default:current_timestamp" json:"updatedAt"`
	DeletedAt *time.Time `bun:",soft_delete,nullzero" json:"deletedAt,omitempty"`
}
