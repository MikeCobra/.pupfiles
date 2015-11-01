#!/bin/bash

PUPFILES_DIR=~/.pupfiles

if [[ $(id -u) -ne 0 ]]; then
	echo "This script needs to run as root" 1>&2
	exit 1
fi


apt-get install -y git

if [ -d $PUPFILES_DIR/.git ]; then
	echo "pulling"
	cd $PUPFILES_DIR
	git pull
	cd -
else
	git clone https://github.com/MikeCobra/.pupfiles.git $PUPFILES_DIR
fi
/opt/puppetlabs/bin/puppet apply --modulepath "$PUPFILES_DIR/modules:/etc/puppetlabs/code/environments/production/modules" $PUPFILES_DIR/manifests/desktop.pp
