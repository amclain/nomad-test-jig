# Load test vars
RATE ?= 5
DURATION ?= 60
TARGET_IP ?= 192.168.249.4

# Build vars
IMAGE_TAG ?= 1

.PHONY: clean run-app load-test build

up:
	@ vagrant up --provision
	@ $(MAKE) run-app

clean:
	@ vagrant destroy -f
	@ rm -rf .vagrant

run-app:
	@ ANSIBLE_HOST_KEY_CHECKING=false \
		ansible-playbook \
		-i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
		ansible/run-nomad-jobs.yml

load-test:
	@ vagrant ssh load-test -c \
		"echo 'GET http://$(TARGET_IP)/' \
		| vegeta attack -rate=$(RATE) -duration=$(DURATION)s \
		| tee /opt/vegeta/result.bin \
		| vegeta report"

# Rebuilds the app container, and accepts an optional IMAGE_TAG param. Normally
# this is not necessary, since the stock images are pulled from docker hub.
build:
	@ cd docker/app; \
	docker build -t amclain/nomad-test-jig-app:$(IMAGE_TAG) .
