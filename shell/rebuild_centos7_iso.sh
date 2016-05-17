#!/bin/bash

SHELL_DIR=$(dirname `readlink -f $0`)
CDROM_DIR=/mnt/cdrom

cd ../..
WORK_DIR=$(pwd)
CREATE_ISO_DIR=${WORK_DIR}/create_iso

# copy all stuff
${SHELL_DIR}/cp_all_stuff.sh

if [ $? -ne 0 ];
then
    exit 1
fi

# generate my own tar bar
cd ${SHELL_DIR}/..
tar -czf ${CREATE_ISO_DIR}/features.tar.gz features/

# regenerate repo file
cd ${CREATE_ISO_DIR}

# create repo info
cd repodata
ls | grep -v comps.xml.gz | xargs rm -f {}
ls | grep comps.xml.gz | xargs -i gunzip {}
ls | xargs -i mv {} comps.xml
cd ${CREATE_ISO_DIR}
createrepo -g repodata/comps.xml .
rm -f repodata/comps.xml

# generate iso file
DATE=$(date +%Y%m%d-%H%M%S)
cd ${CREATE_ISO_DIR}
mkisofs -o ${WORK_DIR}/my-centos-7_x64-${DATE}.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -V 'CentOS 7 x86_64' -boot-load-size 4 -boot-info-table -R -J -v -T ./

