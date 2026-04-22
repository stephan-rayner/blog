help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize and clone submodules
	git submodule update --init --recursive

update: ## Pull latest changes for all submodules
	git submodule update --remote --merge

status: ## Check submodule status
	git submodule status

serve: ## Run Hugo dev server (with drafts)
	cd stephan-rayner && hugo server -D

build: ## Build the site
	cd stephan-rayner && hugo

.PHONY: help init update status serve build
