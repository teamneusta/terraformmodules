#!/bin/bash
echo "# This file is managed by Puppet. DO NOT EDIT.
# 10-puppetlabs-$(lsb_release -sc)
deb http://apt.puppetlabs.com $(lsb_release -sc) puppet6
" > /etc/apt/sources.list.d/10-puppetlabs-bionic.list
apt-get update && apt-get install puppet-agent -y
echo "[main]
ca_server = puppetca
certname = ${host_name}.${stage_name}.${project_name}.azure.neusta.cloud
[agent]
server = puppet
" > /etc/puppetlabs/puppet/puppet.conf
echo "172.21.8.196 puppet
172.21.8.197 puppetca
" >> /etc/hosts
service puppet restart
