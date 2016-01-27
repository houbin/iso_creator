#!/bin/bash

SHELL_DIR=$(dirname `readlink -f $0`)
CDROM_DIR=/mnt/cdrom

cd ${SHELL_DIR}/../..

WORK_DIR=$(pwd)
echo ${WORK_DIR}

# check if cdrom mount
mount | grep /mnt/cdrom
if [ $? -ne 0 ];
then
	echo "/mnt/cdrom not mount"
	exit 1
fi

# check create iso dir, and create if not exit or delete all old stuff in create iso dir
CREATE_ISO_DIR=${WORK_DIR}/create_iso
echo "create iso dir is ${CREATE_ISO_DIR}"
if [ ! -d ${CREATE_ISO_DIR} ];
then
	mkdir ${CREATE_ISO_DIR}
else
	rm -rf ${CREATE_ISO_DIR}/*
fi

# cp all stuff to create iso dir
cd ${CDROM_DIR}
ls -a ${CDROM_DIR}/ | grep -v -E "Packages|^\.$|^\.\.$" | xargs -i cp -rf {} ${CREATE_ISO_DIR}/
${SHELL_DIR}/cp_packages.sh ${CREATE_ISO_DIR}

if [ $? -ne 0 ];
then
	echo "$? cp_package.sh return error"
	exit 1
fi

# copy custom config file
cp -f ${SHELL_DIR}/ks.cfg ${CREATE_ISO_DIR}/isolinux/
cp -f ${SHELL_DIR}/isolinux.cfg ${CREATE_ISO_DIR}/isolinux/

exit








