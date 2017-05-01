# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search

# Idempotently install python.
def install_python(config)
  config.vm.provision "shell",
      inline: "which python > /dev/null || sudo apt-get -y install python"
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "consul" do |c|
    c.vm.host_name = "consul"

    # The Consul UI is on port 8500 at this IP address.
    c.vm.network "private_network", ip: "192.168.249.2"

    c.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "1024"
    end

    install_python(c)

    c.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/consul-vagrant.yml"
    end
  end

  config.vm.define "nomad-server" do |c|
    c.vm.host_name = "nomad-server"

    c.vm.network "private_network", ip: "192.168.249.3"

    c.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "1024"
    end

    install_python(c)

    c.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/nomad-server-vagrant.yml"
    end
  end

  config.vm.define "nomad-client" do |c|
    c.vm.host_name = "nomad-client"

    c.vm.network "private_network", ip: "192.168.249.4"

    c.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "1024"
    end

    install_python(c)

    c.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/nomad-client-vagrant.yml"
    end
  end
end
