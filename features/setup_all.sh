#!/bin/bash

# scan all setup.sh in sub dir

MY_DIR=$(dirname `readlink -f $0`)
cd ${MY_DIR}

ALL_SUB_DIRS=`find -maxdepth 1 -type d | grep -v "^\.$"`

for sub_dir in $ALL_SUB_DIRS;
do
    cd $sub_dir
    if [ -f setup.sh ];
    then
        chmod +x setup.sh
        ./setup.sh
    fi
    cd ..
done

exit
