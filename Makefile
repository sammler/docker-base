help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

build: ## Builds all the dockerfiles in the repository.
	@$(CURDIR)/build-all.sh
.PHONY: build

image: ## Build a Dockerfile (ex. DIR=telnet).
	@:$(call check_defined, DIR, directory of the Dockefile)
	docker build --rm --force-rm -t $(REGISTRY)/$(subst /,:,$(DIR)) ./$(DIR)
.PHONY: image
