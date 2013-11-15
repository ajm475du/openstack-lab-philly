# OpenStack Hands On Lab, Philly

This repo contains a Vagrantfile that will get you up and running with two basic CentOS 6.4 [RDO environment virtual machines](http://openstack.redhat.com/GettingStartedHavana_w_GRE) needed for the OpenStack hands on lab.

[OpenStack Hands On Lab](http://ph.ly/devops1113)  
Tuesday November 19th 2013 @ 6pm  
presented by [OpenStack Philly](http://www.meetup.com/Philly-OpenStack-Meetup-Group/), [Philly DevOps](http://phillydevops.org)

## What do I need to run this?

Make sure you have these apps installed:

* [Vagrant](http://docs.vagrantup.com/v2/installation/index.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## How do I get started?

### Setup the compute vm for the first time

* `vagrant up compute`
* `vagrant ssh compute`
* `sudo packstack --answer-file my_answers.txt` << on the vm
    * Enter `vagrant` when prompted for root password

### Setup the control vm for the first time

* `vagrant up control`
* `vagrant ssh control`
* `sudo packstack --answer-file my_answers.txt` << on the vm
    * Enter `vagrant` when prompted for root password

## Then what?

You're good to go for the lab.

Run `vagrant up` and `vagrant halt` to power both vm's on/off.

## Resources

* [https://wiki.openstack.org/wiki/Packstack](https://wiki.openstack.org/wiki/Packstack)
* [http://openstack.redhat.com/GettingStartedHavana_w_GRE](http://openstack.redhat.com/GettingStartedHavana_w_GRE)
