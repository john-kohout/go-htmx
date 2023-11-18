// Package contacts provides primitives to interact with the openapi HTTP API.
//
// Code generated by github.com/deepmap/oapi-codegen version v1.13.0 DO NOT EDIT.
package contacts

// GetContactsParams defines parameters for GetContacts.
type GetContactsParams struct {
	// Q search query parameter
	Q *string `form:"q,omitempty" json:"q,omitempty"`
}
