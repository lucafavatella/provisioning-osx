.PHONY: all
all: provision-osx

.PHONY: provision-osx
provision-osx:
	@./provision_osx

ANSIBLE_OPTS=-i hosts -c local

ping:
	cd ansible && ansible all $(ANSIBLE_OPTS) -m ping
.PHONY: ping

gather-facts-setup:
	cd ansible && ansible all $(ANSIBLE_OPTS) -m setup
.PHONY: gather-facts-setup

provisioning-osx:
	cd ansible && ansible-playbook $@.yml $(ANSIBLE_OPTS) -v
.PHONY: provisioning-osx
