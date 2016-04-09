# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # https://github.com/holms/vagrant-jessie-box
  config.vm.box = "holms/debian-jessie"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.synced_folder ".", "/home/vagrant", owner: "vagrant", group: "vagrant"
  config.vm.provider "virtualbox"
end
