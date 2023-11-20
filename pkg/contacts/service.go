package contacts

import (
	"context"
	"fmt"
	"regexp"

	"github.com/jmoiron/sqlx"
	"github.com/rs/zerolog/log"
)

const pageSize = 10

type Contact struct {
	ID     int
	First  string `form:"first_name"`
	Last   string `form:"last_name"`
	Phone  string `form:"phone"`
	Email  string `form:"email"`
	errors map[string]string
}

func NewContact() Contact {
	return Contact{
		errors: make(map[string]string),
	}
}

func (c *Contact) Error(key string) string {
	if val, ok := c.errors[key]; ok {
		return val
	}

	return ""
}

type Repository interface {
	GetContacts(ctx context.Context, tx *sqlx.Tx, search *string, page, size int) ([]*Contact, error)
	CreateContact(ctx context.Context, tx *sqlx.Tx, contact Contact) error
	GetContact(ctx context.Context, tx *sqlx.Tx, contactID int) (*Contact, error)
	UpdateContact(ctx context.Context, tx *sqlx.Tx, contact Contact) error
	DeleteContact(ctx context.Context, tx *sqlx.Tx, contactID int) error
	ValidateContactEmail(ctx context.Context, tx *sqlx.Tx, contact *Contact) (*Contact, error)
}

type Service interface {
	GetContacts(ctx context.Context, search *string, page *int) ([]*Contact, error)
	CreateContact(ctx context.Context, contact Contact) error
	GetContact(ctx context.Context, contactID int) (*Contact, error)
	UpdateContact(ctx context.Context, contact Contact) error
	DeleteContact(ctx context.Context, contactID int) error
	ValidateContact(ctx context.Context, contact *Contact) (*Contact, error)
}

var _ Service = (*ServiceDefault)(nil)

type ServiceDefault struct {
	repository Repository
	db         *sqlx.DB
}

func NewService(db *sqlx.DB, r Repository) *ServiceDefault {
	return &ServiceDefault{
		db:         db,
		repository: r,
	}
}

func (s *ServiceDefault) GetContacts(ctx context.Context, search *string, page *int) ([]*Contact, error) {
	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return nil, err
	}
	defer tx.Rollback()

	if page != nil {
		return s.repository.GetContacts(ctx, tx, search, *page, pageSize)
	}

	return s.repository.GetContacts(ctx, tx, search, 1, pageSize)
}

func (s *ServiceDefault) CreateContact(ctx context.Context, contact Contact) error {
	if len(contact.errors) != 0 {
		return fmt.Errorf("contact %d has input errors", contact.ID)
	}

	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return err
	}
	defer tx.Rollback()
	if err = s.repository.CreateContact(ctx, tx, contact); err != nil {
		return err
	}
	return tx.Commit()
}

func (s *ServiceDefault) GetContact(ctx context.Context, contactID int) (*Contact, error) {
	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return nil, err
	}
	defer tx.Rollback()
	return s.repository.GetContact(ctx, tx, contactID)
}

func (s *ServiceDefault) UpdateContact(ctx context.Context, contact Contact) error {
	if len(contact.errors) != 0 {
		return fmt.Errorf("contact %d has input errors", contact.ID)
	}
	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return err
	}
	defer tx.Rollback()
	if err = s.repository.UpdateContact(ctx, tx, contact); err != nil {
		log.Err(err).Send()
		return err
	}
	return tx.Commit()
}

func (s *ServiceDefault) DeleteContact(ctx context.Context, contactID int) error {
	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return err
	}
	defer tx.Rollback()
	if err = s.repository.DeleteContact(ctx, tx, contactID); err != nil {
		return err
	}
	return tx.Commit()
}

func (s *ServiceDefault) ValidateContact(ctx context.Context, contact *Contact) (*Contact, error) {
	tx, err := s.db.BeginTxx(ctx, nil)
	if err != nil {
		return nil, err
	}

	if !isValidPhoneNumber(contact.Phone) {
		contact.errors["phone"] = fmt.Sprintf("%s is not a valid phone number", contact.Phone)
	}

	return s.repository.ValidateContactEmail(ctx, tx, contact)
}

func isValidPhoneNumber(phone string) bool {
	re := regexp.MustCompile(`^\+?1?\d{10}$|^(\+?1?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4})$`)
	return re.MatchString(phone)
}
