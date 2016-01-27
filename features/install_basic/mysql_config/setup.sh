#!/bin/bash

SHELL_DIR=$(dirname `readlink -f $0`)

cd ${SHELL_DIR}
cp my.cnf /etc/ -f
service mysqld restart

mysql -uroot < data_collection.sql
mysql -uroot mysql < mysql.sql
service mysqld restart


