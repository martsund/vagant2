#!/bin/bash

$script = <<SCRIPT
    set -x
    echo I am provisioning...
    date > /etc/vagrant_provisioned_at
    echo "hello world"
    yum install mysql-server -y
    /sbin/service mysqld start
    mysql -e "create user 'mycooluser'@'%' identified by 'mypassword'"

SCRIPT
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/centos-6.5"
  config.vm.provision :shell, :inline => $script

end
