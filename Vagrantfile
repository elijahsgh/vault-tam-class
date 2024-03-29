# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.provision :shell, path: "bootstrap.sh"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.define "consul_s1" do |consul_s1|
    consul_s1.vm.network :forwarded_port, guest: 80, host: 4568
    consul_s1.vm.network :forwarded_port, guest: 8500, host: 9501
    consul_s1.vm.network "private_network", ip: "10.1.42.201"
    consul_s1.vm.provision :shell, path: "consul.sh", args: "consul_s1"
  end

  config.vm.define "consul_s2" do |consul_s2|
    consul_s2.vm.network :forwarded_port, guest: 80, host: 4569
    consul_s2.vm.network :forwarded_port, guest: 8500, host: 9502
    consul_s2.vm.network "private_network", ip: "10.1.42.202"
    consul_s2.vm.provision :shell, path: "consul.sh", args: "consul_s2"
  end

  config.vm.define "consul_s3" do |consul_s3|
    consul_s3.vm.network :forwarded_port, guest: 80, host: 4570
    consul_s3.vm.network :forwarded_port, guest: 8500, host: 9503
    consul_s3.vm.network "private_network", ip: "10.1.42.203"
    consul_s3.vm.provision :shell, path: "consul.sh", args: "consul_s3"
  end

  config.vm.define "vault_s1" do |vault_s1|
    vault_s1.vm.network :forwarded_port, guest: 80, host: 4571
    vault_s1.vm.network :forwarded_port, guest: 8500, host: 9504
    vault_s1.vm.network :forwarded_port, guest: 8200, host: 9604
    vault_s1.vm.network "private_network", ip: "10.1.42.204"
    vault_s1.vm.provision :shell, path: "vault.sh", args: "vault_s1"
  end

  config.vm.define "vault_s2" do |vault_s2|
    vault_s2.vm.network :forwarded_port, guest: 80, host: 4572
    vault_s2.vm.network :forwarded_port, guest: 8500, host: 9505
    vault_s2.vm.network :forwarded_port, guest: 8200, host: 9605
    vault_s2.vm.network "private_network", ip: "10.1.42.205"
    vault_s2.vm.provision :shell, path: "vault.sh", args: "vault_s2"
  end


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
