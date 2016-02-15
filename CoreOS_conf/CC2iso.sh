#!/bin/bash
#Author : ximepa <ximepa@tadam.com>

#we read a cloud-config file and make it an iso via genisoimage binary

if [[ $# -eq 0 ]] ; then
    echo -e '\nUse the following format : '
    echo -e 'run ./CC2iso.sh <cloud-config-file> <[optional]: Output Directory where to copy iso drive> \n'
    exit 0
fi

CCFile="$1"

if [[ $# -eq 2 ]]; then
		OutputDir="$2"
	echo -e "Outputting to : $OutputDir\n"
else OutputDir=${PWD}
fi

mkdir -p /tmp/new-drive/openstack/latest
cp $CCFile /tmp/new-drive/openstack/latest/userdata

genisoimage -R -V config-2 -o $OutputDir/configdrive.iso /tmp/new-drive

