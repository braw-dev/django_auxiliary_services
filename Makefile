.DEFAULT_GOAL := help

VAGRANT := vagrant --provider=virtualbox
PIPENV_RUN := pipenv run

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: up
up: ## Start the Vagrant environment
	${VAGRANT} up 

.PHONY: provision
provision: ## Provision the Vagrant environment
	${PIPENV_RUN} ansible-playbook \
		--inventory-file=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
		--private-key=.vagrant/machines/default/virtualbox/private_key \
		--user=vagrant \
		playbooks/provision.yaml

.PHONY: destroy
destroy: ## Destroy the Vagrant environment
	${VAGRANT} destroy -f
