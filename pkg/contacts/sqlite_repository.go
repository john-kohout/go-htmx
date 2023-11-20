package contacts

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/jmoiron/sqlx"
	"github.com/rs/zerolog/log"
)

const (
	selectFields = `id,
first_name,
last_name,
phone,
email`
)

type sqlContact struct {
	ID     int    `db:"id"`
	First  string `db:"first_name"`
	Last   string `db:"last_name"`
	Phone  string `db:"phone"`
	Email  string `db:"email"`
	Errors string `db:"errors"`
}

func toSqlContact(c Contact) sqlContact {
	errors := ""
	errorsMap, err := json.Marshal(c.errors)
	if err == nil {
		errors = string(errorsMap)
	}

	if c.ID != 0 {
		return sqlContact{
			ID:     c.ID,
			First:  c.First,
			Last:   c.Last,
			Phone:  c.Phone,
			Email:  c.Email,
			Errors: errors,
		}
	}

	return sqlContact{
		First:  c.First,
		Last:   c.Last,
		Phone:  c.Phone,
		Email:  c.Email,
		Errors: errors,
	}
}

func (c *sqlContact) toContact() *Contact {
	errors := make(map[string]string)
	_ = json.Unmarshal([]byte(c.Errors), &errors)
	return &Contact{
		ID:     c.ID,
		First:  c.First,
		Last:   c.Last,
		Phone:  c.Phone,
		Email:  c.Email,
		errors: errors,
	}
}

var _ Repository = (*SqliteRepository)(nil)

type SqliteRepository struct {
}

func (s SqliteRepository) GetContacts(ctx context.Context, tx *sqlx.Tx, search *string, page, size int) ([]*Contact, error) {
	query := fmt.Sprintf("SELECT %s FROM contacts", selectFields)
	contacts := make([]sqlContact, 0)
	args := make([]interface{}, 0, 6)
	var err error

	if search != nil {
		query = fmt.Sprintf("%s WHERE first_name LIKE ? OR last_name LIKE ? OR phone LIKE ? OR email LIKE ?", query)
		searchArg := fmt.Sprintf("%%%s%%", *search)
		for i := 0; i < 4; i++ {
			args = append(args, searchArg)
		}
	}

	if size > 0 {
		query = fmt.Sprintf("%s LIMIT ? OFFSET ?", query)
		args = append(args, size)
		args = append(args, (page-1)*size)
	}

	err = tx.SelectContext(ctx, &contacts, query, args...)
	if err != nil {
		return nil, err
	}

	return toContacts(contacts), nil
}

func (s SqliteRepository) CreateContact(ctx context.Context, tx *sqlx.Tx, contact Contact) error {
	query := "INSERT INTO contacts (first_name, last_name, phone, email) VALUES (:first_name, :last_name, :phone, :email)"
	_, err := tx.NamedExecContext(ctx, query, toSqlContact(contact))
	if err != nil {
		return err
	}

	return nil
}

func (s SqliteRepository) GetContact(ctx context.Context, tx *sqlx.Tx, contactID int) (*Contact, error) {
	query := fmt.Sprintf("SELECT %s FROM contacts WHERE id = ?", selectFields)
	contacts := make([]sqlContact, 0)
	err := tx.SelectContext(ctx, &contacts, query, contactID)
	if err != nil {
		return nil, err
	}
	if len(contacts) == 0 {
		return nil, nil
	}

	return contacts[0].toContact(), nil
}

func (s SqliteRepository) UpdateContact(ctx context.Context, tx *sqlx.Tx, contact Contact) error {
	log.Info().Msgf("contact id: %d", contact.ID)
	sqlQ := toSqlContact(contact)
	log.Info().Msgf("contact id: %d", sqlQ.ID)
	query := "UPDATE contacts SET first_name = :first_name, last_name = :last_name, phone = :phone, email = :email WHERE id = :id"
	_, err := tx.NamedExecContext(ctx, query, toSqlContact(contact))
	if err != nil {
		return err
	}
	return nil
}

func (s SqliteRepository) DeleteContact(ctx context.Context, tx *sqlx.Tx, contactID int) error {
	query := "DELETE FROM contacts WHERE id = ?"
	_, err := tx.ExecContext(ctx, query, contactID)
	if err != nil {
		return err
	}
	return nil
}

func (s SqliteRepository) ValidateContactEmail(ctx context.Context, tx *sqlx.Tx, contact *Contact) (*Contact, error) {
	query := fmt.Sprintf("SELECT %s FROM contacts WHERE email = ?", selectFields)
	contacts := make([]sqlContact, 0)
	var err error

	err = tx.SelectContext(ctx, &contacts, query, contact.Email)
	if err != nil {
		return contact, err
	}

	if len(contacts) == 0 {
		return contact, nil
	}

	contact.errors["email"] = fmt.Sprintf("%s is already in use", contact.Email)
	return contact, nil
}

func toContacts(sqlContacts []sqlContact) []*Contact {
	contacts := make([]*Contact, 0, len(sqlContacts))
	for _, c := range sqlContacts {
		contacts = append(contacts, c.toContact())
	}

	return contacts
}
