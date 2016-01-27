#/bin/bash

# basic setup.sh

SHELL_DIR=$(dirname `readlink -f $0`)

# copy all so
cd ${SHELL_DIR}
chmod +x so/install_so.sh
./so/install_so.sh

if [ $? -ne 0 ];
then
	exit 1
fi
cd ${SHELL_DIR}

# install redis
cd ${SHELL_DIR}
chmod +x redis/install_redis.sh
./redis/install_redis.sh

if [ $? -ne 0 ];
then
	exit 1
fi
cd ${SHELL_DIR}

# install basic rpms
rpm -ivh rpms/* --nodeps --force

# config mysql
cd ${SHELL_DIR}
./mysql_config/setup.sh

exit 0

