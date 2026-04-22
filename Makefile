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

deploy: build ## Build and deploy to GitHub Pages (must be on main branch)
	@[ "$$(git branch --show-current)" = "main" ] || { echo "Error: deploy must be run from the main branch"; exit 1; }
	cd stephan-rayner/public && git add . && git commit -m "Rebuild site" && git push origin main

.PHONY: help init update status serve build deploy
