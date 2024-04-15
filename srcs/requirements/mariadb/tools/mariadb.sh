#!/bin/sh

set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mysql_install_db --user=mysql --datadir=/var/lib/mysql

cat << EOF > create_user_and_database
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE user='';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS $MYSQL_USER@'%';
SET PASSWORD FOR $MYSQL_USER@'%'=PASSWORD("$MYSQL_PASSWORD");
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysqld --bootstrap --user=mysql < create_user_and_database

if [ -z $(getent passwd mariadb) ]; then
	adduser -D mariadb
	chown -R mariadb:mariadb /var/lib/mysql
fi

chmod 755 -R /var/lib/mysql

exec mariadbd -u root