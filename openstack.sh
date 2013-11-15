#!/usr/bin/env bash

yum install -y http://rdo.fedorapeople.org/openstack-havana/rdo-release-havana.rpm
yum install -y openstack-packstack

if [ ! -f my_answers.txt ]; then
  packstack --gen-answer-file my_answers.txt

  ETH0IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | cut -d' ' -f1)
  ETH1IP=$(/sbin/ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | cut -d' ' -f1)

  sed -i "s|${ETH0IP}|${ETH1IP}|g" my_answers.txt

  sed -i 's/^CONFIG_NOVA_COMPUTE_HOSTS\=.*$/CONFIG_NOVA_COMPUTE_HOSTS=192.168.122.3/i' my_answers.txt
  sed -i 's/^CONFIG_NEUTRON_OVS_TENANT_NETWORK_TYPE\=.*$/CONFIG_NEUTRON_OVS_TENANT_NETWORK_TYPE=gre/i' my_answers.txt
  sed -i 's/^CONFIG_NEUTRON_OVS_TUNNEL_RANGES\=.*$/CONFIG_NEUTRON_OVS_TUNNEL_RANGES=1:1000/i' my_answers.txt
  sed -i 's/^CONFIG_NEUTRON_OVS_TUNNEL_IF\=.*$/CONFIG_NEUTRON_OVS_TUNNEL_IF=eth2/i' my_answers.txt
  sed -i 's/^CONFIG_SWIFT_INSTALL\=.*$/CONFIG_SWIFT_INSTALL=y/i' my_answers.txt

  chown vagrant:vagrant my_answers.txt
fi
