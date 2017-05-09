.PHONY: clean run-app

clean:
	@ vagrant destroy -f
	@ rm -rf .vagrant

run-app:
	@ ANSIBLE_HOST_KEY_CHECKING=false \
		ansible-playbook \
		-i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
		ansible/run-nomad-jobs.yml
