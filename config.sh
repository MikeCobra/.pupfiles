#!/bin/bash

PUPFILES_DIR=~/.pupfiles
REQUIRED_PUPPET_MODULES="puppetlabs-vcsrepo acme-ohmyzsh"

echo "Checking if root..."
if [[ $(id -u) -ne 0 ]]; then
	echo "This script needs to run as root" 1>&2
	exit 1
fi

echo "Checking for puppet repo..."
apt-cache policy | grep puppet

if [[ $? -ne 0 ]]; then
	echo "Adding repo for puppet..."
	wget https://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb
	dpkg -i puppetlabs-release-pc1-wheezy.deb
	apt-get update
fi

echo "Installing puppet..."
apt-get install -y git puppet-agent

function install_puppet_module {
	if [[ $# -ne 1 ]]; then
		echo "Incorrect number of arguments for installing puppet module" 1>&2
		exit 1
	fi
	echo "Checking if puppet module is installed: $1"
	/opt/puppetlabs/bin/puppet module list | grep $1
	if [[ $? -ne 0 ]]; then
		echo "Installing puppet module: $1"
		/opt/puppetlabs/bin puppet module install $1
	fi
}

echo "Installing puppet modules..."
for module in $REQUIRED_PUPPET_MODULES; do
	install_puppet_module $module
done

echo "Fetching pupfiles..."
if [ -d $PUPFILES_DIR/.git ]; then
	echo "Already clone, pulling latest..."
	cd $PUPFILES_DIR
	git pull
	cd -
else
	echo "Cloning repo..."
	git clone https://github.com/MikeCobra/.pupfiles.git $PUPFILES_DIR
fi

echo "Applying puppet config..."
/opt/puppetlabs/bin/puppet apply --modulepath "$PUPFILES_DIR/modules:/etc/puppetlabs/code/environments/production/modules" $PUPFILES_DIR/manifests/desktop.pp
