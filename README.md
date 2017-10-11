# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
PENTAHO_VERSION="6.0.1.0-386"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "biu-training-dev"
  config.vm.network "private_network", ip: "192.168.33.33"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "4096"
    vb.cpus = 4
    vb.name = "biu-training-dev"
    
    # enable copy/paste between host and guest
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional'] 
    
    # fix for possible network slowness
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # to enable automatic hosts management on the host machine run the following command: vagrant plugin install vagrant-hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # mandatory provisioning to setup the vm
  config.vm.provision "shell", path: "setup-swap.sh"
  config.vm.provision "shell", path: "provision-system.sh"

  # add a mysql-server
  #config.vm.provision "shell", path: "provision-mysql.sh"
  
  # add a pentaho EE installation
  # requires the EE bin installer to be inside the shared folder
  #config.vm.provision "shell", path: "provision-pentaho-ee.sh", args: [PENTAHO_VERSION]

  # add a pentaho CE installation
  # requires the biserver and pdi zip files to the inside the shared folder
  #config.vm.provision "shell", path: "provision-pentaho-ce.sh", args: [PENTAHO_VERSION]

  config.vm.synced_folder "shared", "/shared-files"
end
