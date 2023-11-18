package contacts

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"

	"github.com/john-kohout/go-htmx/pkg/contacts"
	"github.com/john-kohout/go-htmx/web/templates"
)

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
	c, err := s.contactsService.GetContacts(ctx.Request().Context(), params.Q)
	if err != nil {
		return err
	}
	q := ""
	if params.Q != nil {
		q = *params.Q
	}

	return ctx.Render(http.StatusOK, "", templates.Contacts(q, c))
}

func (s *Server) NewContactForm(ctx echo.Context) error {
	return ctx.Render(http.StatusOK, "", templates.NewContact(contacts.Contact{}))
}

func (s *Server) CreateContact(ctx echo.Context) error {
	c := contacts.Contact{}
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
		return ctx.Render(http.StatusOK, "", templates.EditContact(c))
	}

	return ctx.Redirect(http.StatusSeeOther, fmt.Sprintf("/contacts/%d", contactId))
}
