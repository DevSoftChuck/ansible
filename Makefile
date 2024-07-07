.PHONY: all
all:
	ansible-playbook -t all --ask-vault-pass local.yml

.PHONY: docker
docker:
	docker build . -t new-env
	docker run --rm -it new-env bash

.PHONY: encrypt
encrypt:
	ansible-vault encrypt .ssh/id_ed25519
	ansible-vault encrypt .ssh/id_ed25519.pub

.PHONY: decrypt
decrypt:
	ansible-vault decrypt .ssh/id_ed25519
	ansible-vault decrypt .ssh/id_ed25519.pub
