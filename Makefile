# Makefile

TEMPL_DIR = web/templates
CONTACTS_CMD = cmd/contacts

help:
	@echo "Available targets:"
	@echo "  templ        - Generates templ templates in the $(TEMPL_DIR) directory"
	@echo "  run/contacts - Run the contacts service"

templ:
	cd $(TEMPL_DIR) && templ generate

run/contacts:
	go run github.com/john-kohout/go-htmx/cmd/contacts

.PHONY: help templ other

.DEFAULT_GOAL := help