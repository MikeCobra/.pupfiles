#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
	echo "This script needs to run as root" 1>&2
	exit 1
fi


apt-get install -y git
/opt/puppetlabs/bin/puppet apply --modulepath ~/.pupfiles/modules ~/.pupfiles/manifests/desktop.pp
