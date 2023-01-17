up: cloud_up
	./scripts/run_ansible.sh

cloud_up: acquire_tokens
	./scripts/cloud_up.sh
	./scripts/create_inventory.sh

acquire_tokens:
	./scripts/acquire_tokens.sh

down:
	./scripts/cloud_down.sh
