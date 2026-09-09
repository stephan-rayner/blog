.DEFAULT_GOAL := help

CHROME := /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
SLIDES_SRC := slides-src/slides.html
OUTPUT := trading-in-trust-slides.pdf

.PHONY: help generate

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

generate: ## Regenerate trading-in-trust-slides.pdf from slides-src/slides.html
	"$(CHROME)" --headless --disable-gpu \
	  --no-pdf-header-footer --print-to-pdf="$(CURDIR)/$(OUTPUT)" \
	  --print-to-pdf-no-header "file://$(CURDIR)/$(SLIDES_SRC)"
