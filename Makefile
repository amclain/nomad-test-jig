# Load test vars
RATE ?= 5
DURATION ?= 60
TARGET_IP ?= 192.168.249.4

.PHONY: clean run-app load-test

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
		"echo 'GET http://$(TARGET_IP)/' | \
		vegeta attack -rate=$(RATE) -duration=$(DURATION)s > /opt/vegeta/result.bin && \
		vegeta report -inputs=/opt/vegeta/result.bin"
