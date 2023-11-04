package main

import (
	"context"
	"database/sql"
	"fmt"
	"math/rand"
	"time"

	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/driver/pgdriver"
	"github.com/uptrace/bun/extra/bundebug"
)

const USER_COUNT int = 20
const USER_NOTE_COUNT int = 10
const USER_CONTACT_COUNT int = 10

type Users struct {
	bun.BaseModel `bun:"users"`

	Id       int `bun:",pk,autoincrement"`
	Username string
	Email    string

	CreatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	UpdatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	DeletedAt time.Time `bun:",soft_delete,nullzero"`
}

type UserContacts struct {
	bun.BaseModel `bun:"user_contacts"`

	UserId int
	Name   string
	Email  string

	CreatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	UpdatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	DeletedAt time.Time `bun:",soft_delete,nullzero"`
}

type UserNotes struct {
	bun.BaseModel `bun:"user_notes"`

	UserId  int
	Title   string
	Content string

	CreatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	UpdatedAt time.Time `bun:",nullzero,notnull,default:current_timestamp"`
	DeletedAt time.Time `bun:",soft_delete,nullzero"`
}

var db *bun.DB

func main() {
	dsn := "postgres://root:root@localhost/rest_api_benchmarks?sslmode=disable"
	sqlDb := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))
	db = bun.NewDB(sqlDb, pgdialect.New())
	db.AddQueryHook(bundebug.NewQueryHook(bundebug.WithVerbose(true)))

	if err := clearTables(); err != nil {
		panic(err)
	}

	if err := seedDatabase(); err != nil {
		panic(err)
	}
}

func clearTables() error {
	tables := []interface{}{
		(*UserContacts)(nil),
		(*UserNotes)(nil),
        (*Users)(nil),
	}

	for _, table := range tables {
		_, err := db.NewDelete().Model(table).Where("true").ForceDelete().Exec(context.Background())
		if err != nil {
			return err
		}
	}

	return nil
}

func seedDatabase() error {
	for i := 0; i < USER_COUNT; i++ {
		user := Users{
			Username: fmt.Sprintf("user%v", i),
			Email:    fmt.Sprintf("user%v@domain.ext", i),
		}
		if _, err := db.NewInsert().Model(&user).Exec(context.Background()); err != nil {
			return err
		}

		contacts := make([]UserContacts, USER_CONTACT_COUNT)
		for j := 0; j < USER_CONTACT_COUNT; j++ {
			contacts[j] = UserContacts{
				UserId: user.Id,
				Name:   fmt.Sprintf("User%v's contact #%v", i, j),
				Email:  fmt.Sprintf("contact%v@domain.ext", j),
			}
		}
		if _, err := db.NewInsert().Model(&contacts).Exec(context.Background()); err != nil {
			return err
		}

		notes := make([]UserNotes, USER_NOTE_COUNT)
		for j := 0; j < USER_NOTE_COUNT; j++ {
			notes[j] = UserNotes{
				UserId:  user.Id,
				Title:   fmt.Sprintf("User%v's note #%v", j, j),
				Content: generateRandomString(rand.Intn(1000) + 100),
			}
		}
		if _, err := db.NewInsert().Model(&notes).Exec(context.Background()); err != nil {
			return err
		}
	}

	return nil
}

var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")

func generateRandomString(n int) string {
	b := make([]rune, n)
	for i := range b {
		b[i] = letters[rand.Intn(len(letters))]
	}
	return string(b)
}
