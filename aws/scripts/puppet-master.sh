#!/bin/bash
# Download Puppet master monolithic:
wget -O puppet.tar.gz https://s3.amazonaws.com/puppet-package-download/puppet-enterprise-2018.1.2-ubuntu-16.04-amd64.tar.gz
# extract
tar -xf *.tar.gz
cd puppet
# Download pe.conf file
wget s3://cjc-nobody-should-ever-use-this-name-0987654321/pe.conf
# Install puppet server
./puppet-enterprise-installer -c pe.conf
# Add * to autosign.conf
cat >> /etc/puppetlabs/puppet/autosign.conf <<'AUTOSIGN'
*
AUTOSIGN
wget -O /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa s3://nobody-should-ever-use-this-name-0987654321/id-control_repo.rsa
# Run puppet agent
/usr/local/bin/puppet agent -t
