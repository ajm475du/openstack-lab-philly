# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'openstack-centos-6.4'
  config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box'
  config.vm.provision 'shell', path: 'openstack.sh'

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "860",
      "--cpus", 1
    ]
  end

  config.vm.define 'compute' do |compute|
    compute.vm.network :private_network, ip: '192.168.122.3'
    compute.vm.network :private_network, ip: '192.168.123.3'
  end

  config.vm.define 'control' do |control|
    control.vm.network :private_network, ip: '192.168.122.2'
    control.vm.network :private_network, ip: '192.168.123.2'
  end
end
