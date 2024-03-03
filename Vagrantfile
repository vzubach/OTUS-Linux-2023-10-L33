# -*- mode: ruby -*-
# vi: set ft=ruby : vsa

Vagrant.configure(2) do |config| 
 config.vm.box = "hashicorp/bionic64"
 config.vm.box_version = "1.0.282"
 config.vm.provider "virtualbox" do |v| 
  v.memory = 512 
  v.cpus = 1 
 end 
 config.vm.define "router1" do |router1| 
  router1.vm.network "private_network", ip: "10.0.10.1",  netmask: "255.255.255.252",  virtualbox__intnet: "r1-r2" 
  router1.vm.network "private_network", ip: "10.0.12.1",  netmask: "255.255.255.252",  virtualbox__intnet: "r1-r3"
  router1.vm.network "private_network", ip: "192.168.10.1",  netmask: "255.255.255.0",  virtualbox__intnet: "net1"
  #router1.vm.network "private_network", ip: "192.168.56.10",  name: "vboxnet0"
  router1.vm.hostname = "router1" 
  router1.vm.provision "shell", path: "router1.sh"
  router1.vm.provision "shell", run: "always", inline: <<-SHELL
     cp /vagrant/frr-r1.conf /etc/frr/frr.conf
     systemctl restart frr
   SHELL
 end 
 config.vm.define "router2" do |router2| 
  #router2.vm.network "private_network", type: "dhcp"
  router2.vm.network "private_network", ip: "10.0.10.2",  netmask: "255.255.255.252",  virtualbox__intnet: "r1-r2"
  router2.vm.network "private_network", ip: "10.0.11.2",  netmask: "255.255.255.252",  virtualbox__intnet: "r2-r3"
  router2.vm.network "private_network", ip: "192.168.20.1",  netmask: "255.255.255.0",  virtualbox__intnet: "net2"
  router2.vm.hostname = "router2" 
  router2.vm.provision "shell", path: "router1.sh"
  router2.vm.provision "shell", run: "always", inline: <<-SHELL
     cp /vagrant/frr-r2.conf /etc/frr/frr.conf
     systemctl restart frr
   SHELL
 end 
 config.vm.define "router3" do |router3| 
  router3.vm.network "private_network", ip: "10.0.11.1",  netmask: "255.255.255.252", virtualbox__intnet: "r2-r3" 
  router3.vm.network "private_network", ip: "10.0.12.2",  netmask: "255.255.255.252",  virtualbox__intnet: "r1-r3"
  router3.vm.network "private_network", ip: "192.168.30.1",  netmask: "255.255.255.0",  virtualbox__intnet: "net3"
  router3.vm.hostname = "router3"
  router3.vm.provision "shell", path: "router1.sh"
  router3.vm.provision "shell", run: "always", inline: <<-SHELL
     cp /vagrant/frr-r3.conf /etc/frr/frr.conf
     systemctl restart frr
   SHELL
 end 
end
