#!/bin/bash

SHELL_DIR=$(dirname `readlink -f $0`)
RPM_LIST_FILE=${SHELL_DIR}/rpm.list

CREATE_ISO_DIR=$1
if [ "${CREATE_ISO_DIR}" == "" ];
then
	echo "no create_iso_dir"
	exit 1
fi

PACKAGE_DIR=${CREATE_ISO_DIR}/Packages
echo ${PACKAGE_DIR}

mount | grep /mnt/cdrom
if [ $? -ne 0 ];
then
    echo "cdrom not mount"
    exit 2
fi

# clear package dir
if [ ! -d ${PACKAGE_DIR} ];then
	mkdir ${PACKAGE_DIR}
else
	rm -rf ${PACKAGE_DIR}/*
fi

for i in $(cat ${RPM_LIST_FILE})
do
	# copy package
	ls /mnt/cdrom/Packages/ | grep -E "^${i}-[0-9]+\." | grep -v i686 | xargs -i cp /mnt/cdrom/Packages/{} ${PACKAGE_DIR}/
    [ $? -ne 0 ] && echo "copy ${i} failed" && exit 3
done

exit 0

