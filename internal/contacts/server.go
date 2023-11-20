package contacts

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"

	"github.com/john-kohout/go-htmx/pkg/contacts"
	"github.com/john-kohout/go-htmx/web/templates"
)

//go:generate oapi-codegen -package contacts -generate server -o server.gen.go ../../api/contacts/openapi.yaml
//go:generate oapi-codegen -package contacts -generate types -o types.gen.go ../../api/contacts/openapi.yaml

// const pagination = InfiniteScroll

var _ ServerInterface = (*Server)(nil)

// Server implements ServerInterface
type Server struct {
	contactsService contacts.Service
}

func NewServer(cs contacts.Service) *Server {
	return &Server{
		contactsService: cs,
	}
}

func (s *Server) Index(ctx echo.Context) error {
	return ctx.Redirect(http.StatusMovedPermanently, "/contacts")
}

func (s *Server) GetContacts(ctx echo.Context, params GetContactsParams) error {
	c, err := s.contactsService.GetContacts(ctx.Request().Context(), params.Q, params.Page)
	if err != nil {
		return err
	}

	q := ""
	if params.Q != nil {
		q = *params.Q
	}

	p := 1
	if params.Page != nil {
		p = *params.Page
	}

	pag := templates.PaginationNone
	if params.Pagination != nil {
		pag = templates.PaginationValue(*params.Pagination)
	}

	return ctx.Render(http.StatusOK, "", templates.Contacts(c, q, pag, p))
}

func (s *Server) NewContactForm(ctx echo.Context) error {
	return ctx.Render(http.StatusOK, "", templates.NewContact(contacts.Contact{}))
}

func (s *Server) CreateContact(ctx echo.Context) error {
	c := contacts.NewContact()
	if err := ctx.Bind(&c); err != nil {
		return err
	}

	if err := s.contactsService.CreateContact(ctx.Request().Context(), c); err != nil {
		return ctx.Render(http.StatusBadRequest, "", templates.NewContact(c))
	}

	return ctx.Redirect(http.StatusSeeOther, "/contacts")
}

func (s *Server) GetContact(ctx echo.Context, contactId int) error {
	c, err := s.contactsService.GetContact(ctx.Request().Context(), contactId)
	if err != nil {
		return err
	}
	if c == nil {
		return ctx.Render(http.StatusNotFound, "", templates.ContactNotFound())
	}

	return ctx.Render(http.StatusOK, "", templates.ShowContact(*c))
}

func (s *Server) DeleteContact(ctx echo.Context, contactId int) error {
	err := s.contactsService.DeleteContact(ctx.Request().Context(), contactId)
	if err != nil {
		return err
	}

	return ctx.Redirect(http.StatusSeeOther, "/contacts")
}

func (s *Server) EditContactForm(ctx echo.Context, contactId int) error {
	c, err := s.contactsService.GetContact(ctx.Request().Context(), contactId)
	if err != nil {
		return err
	}
	if c == nil {
		return ctx.Render(http.StatusNotFound, "", templates.ContactNotFound())
	}

	return ctx.Render(http.StatusOK, "", templates.EditContact(*c))
}

func (s *Server) EditContact(ctx echo.Context, contactId int) error {
	c := contacts.Contact{}
	if err := ctx.Bind(&c); err != nil {
		return err
	}

	c.ID = contactId
	if err := s.contactsService.UpdateContact(ctx.Request().Context(), c); err != nil {
		return ctx.Render(http.StatusBadRequest, "", templates.EditContact(c))
	}

	return ctx.Redirect(http.StatusSeeOther, fmt.Sprintf("/contacts/%d", contactId))
}

func (s *Server) ValidateEmail(ctx echo.Context, contactId int, params ValidateEmailParams) error {
	contact, err := s.contactsService.GetContact(ctx.Request().Context(), contactId)
	if err != nil {
		return err
	}

	if contact == nil || contact.Email == params.Email {
		return ctx.String(http.StatusOK, "")
	}

	contact.Email = params.Email
	contact, err = s.contactsService.ValidateContact(ctx.Request().Context(), contact)
	if err != nil {
		return err
	}

	if emailErr := contact.Error("email"); emailErr != "" {
		return ctx.String(http.StatusOK, emailErr)
	}

	return ctx.String(http.StatusOK, "")
}
