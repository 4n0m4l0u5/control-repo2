#!/bin/bash
# Download puppet agent
#wget -O agent.deb https://s3.amazonaws.com/puppet-package-download/puppet-agent_5.5.3-1xenial_amd64.deb
curl -k https://1.0.0.10:8140/packages/current/install.bash | sudo bash
export PATH="/opt/puppetlabs/bin:$PATH"
source ~/.bashrc
puppet agent --test
