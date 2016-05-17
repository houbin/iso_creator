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
cd ${SHELL_DIR}
cd ..
tar -czf ${CREATE_ISO_DIR}/features.tar.gz features/

# regenerate repo file
cd ${CREATE_ISO_DIR}

declare -x discinfo=$(head -1 .discinfo)
mv ${CREATE_ISO_DIR}/repodata/*x86_64-comps.xml ${CREATE_ISO_DIR}/repodata/c6-x86_64-comps.xml
createrepo -g ${CREATE_ISO_DIR}/repodata/c6-x86_64-comps.xml ./
echo "discinfo is $discinfo"

mv ${CREATE_ISO_DIR}/repodata/*x86_64-comps.xml ${CREATE_ISO_DIR}/repodata/c6-x86_64-comps.xml
createrepo -u "media://$discinfo" -g ${CREATE_ISO_DIR}/repodata/*c6-x86_64-comps.xml ${CREATE_ISO_DIR}

# generate iso file
cd ${CREATE_ISO_DIR}

DATE=$(date +%Y%m%d-%H%M%S)
mkisofs -o ../my-centos-6.6_x64-${DATE}.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -V -T ${CREATE_ISO_DIR}
