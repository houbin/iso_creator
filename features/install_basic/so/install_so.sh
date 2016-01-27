#!/bin/bash

# copy so files

SHELL_DIR=$(dirname `readlink -f $0`)
LIB_DIR=/usr/lib64

# copy libevent so
cd ${SHELL_DIR}
chmod 755 libevent-2.1.so.5.0.0
cp -f libevent-2.1.so.5.0.0 ${LIB_DIR}
cd ${LIB_DIR}
ln -s libevent-2.1.so.5.0.0 libevent-2.1.so.5

cd ${SHELL_DIR}

exit
