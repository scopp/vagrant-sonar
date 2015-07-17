# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "base"
  #config.vm.box = "hashicorp/precise32" #<-- 12.04 LTS
  #config.vm.box = "ubuntu/vivid64" #<--15.04
  config.vm.box = "ubuntu/trusty64" #<-- 14.04 LTS
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.provision "shell", path: "./scripts/setup-dependencies.sh", privileged: false

  config.vm.provision :puppet do |puppet|
    puppet.options = "--modulepath /home/vagrant/.puppet/modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end
end
