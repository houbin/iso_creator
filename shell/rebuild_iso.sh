#!/bin/bash
SHELL_DIR=$(readlink -f `dirname $0`)

echo ${SHELL_DIR}
cd ${SHELL_DIR}

IF_CENTOS6=$(cat /etc/issue | grep "CentOS release 6")
IF_CENTOS7=$(cat /etc/issue | grep "CentOS release 7")
if [ "${IF_CENTOS6}" != "" ];
then
    echo "centos 6"
    ./rebuild_centos6_iso.sh
elif [ "${IF_CENTOS7}" != "" ];
then
    echo "centos 7"
    ./rebuild_centos7_iso.sh
else
    echo "[error] centos version not 6.* or 7"
fi


