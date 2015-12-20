#!/bin/bash

# install redis

LOG_FILE=/tmp/install_online_service.log
SHELL_DIR=$(dirname `readlink -f $0`)
WORK_DIR=/root/src

if [ ! -d ${WORK_DIR} ];
then
	mkdir ${WORK_DIR}
fi

cd ${SHELL_DIR}

if [ ! -f redis-3.0.5.tar.gz ];
then
	echo "安装redis失败，没有redis-3.0.5.tar.gz文件"
	exit 1
else
	cp redis-3.0.5.tar.gz ${WORK_DIR}
	cd ${WORK_DIR}
	tar -xzf redis-3.0.5.tar.gz 2>&1 >> ${LOG_FILE}
	cd redis-3.0.5
	make -j 8 2>&1 >> ${LOG_FILE}
	make install 2>&1 >> ${LOG_FILE}
	echo -e "\n\n\n\n\n\n" | ./utils/install_server.sh

	# add passwd
	sed -i "s/# requirepass foobared/requirepass Jovision.123/g" /etc/redis/6379.conf
	echo "redis安装成功，且redis密码已经设置为Jovision.123"
fi

exit

