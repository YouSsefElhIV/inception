#!/bin/bash

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mariadb-install-db --user=mysql --datadir="/var/lib/mysql" --skip-test-db

/usr/sbin/mysqld --user=mysql &

until mysqladmin -u root ping --silent;do
	sleep 2
done
if [ ! -e file.sql ]
then
	echo "CREATE DATABASE ${WORDPRESS_DB_NAME};" > file.sql
	echo "CREATE USER '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >> file.sql
	echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';" >> file.sql
	echo "FLUSH PRIVILEGES;" >> file.sql

	/usr/bin/mysql -u root < file.sql
fi
mysqladmin -u root shutdown

exec /usr/sbin/mysqld --user=mysql --bind-address=0.0.0.0


