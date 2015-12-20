#/bin/bash

# online_service setup.sh

SHELL_DIR=$(dirname `readlink -f $0`)
WORK_DIR=/work/online_service
CONFIG_DIR=/etc/jovision/alarm/conf

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

# install deviceOnline
cd ${SHELL_DIR}
if [ ! -d ${WORK_DIR} ];
then
	mkdir -p ${WORK_DIR}
fi

if [ ! -d ${CONFIG_DIR} ];
then
	mkdir -p ${CONFIG_DIR}
fi

cd release
DEVICE_ONLINE_TAR=$(ls | grep deviceOnline | grep tar.gz)
USER_ONLINE_TAR=$(ls | grep userOnline | grep tar.gz)
DEVICE_ONLINE=$(echo ${DEVICE_ONLINE_TAR} | awk -F ".tar.gz" '{printf("%s\n", $1)}')
USER_ONLINE=$(echo ${USER_ONLINE_TAR} | awk -F ".tar.gz" '{printf("%s\n", $1)}')

cp ${DEVICE_ONLINE_TAR} ${WORK_DIR}
cp ${USER_ONLINE_TAR} ${WORK_DIR}

cd ${WORK_DIR}
tar -xzf ${DEVICE_ONLINE_TAR}
cd ${DEVICE_ONLINE}
cp -f conf/* ${CONFIG_DIR}/

cd ${WORK_DIR}
tar -xzf ${USER_ONLINE_TAR}
cd ${USER_ONLINE}
cp -f conf/* ${CONFIG_DIR}/

echo
echo
echo "上线服务程序已经放在${WORK_DIR}目录下，请在启动上线服务前，修改${CONFIG_DIR}下的配置文件"
echo
echo

cd ${SHELL_DIR}

exit

