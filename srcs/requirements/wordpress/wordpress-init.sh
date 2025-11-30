#!/bin/bash

until mysql -u ${WORDPRESS_DB_USER} -p${WORDPRESS_DB_PASSWORD} -h ${WORDPRESS_DB_HOST} -e "SELECT 1" >/dev/null 2>&1
do
	sleep 5
done
cd /var/www/html

sed -i 's|^listen = /run/php/php8.4-fpm.sock|listen = 0.0.0.0:9001|' /etc/php/8.4/fpm/pool.d/www.conf

if [ ! -e /var/www/html/wp-config.php ]
then
	wp core download --allow-root
	wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
	chown -R www-data:www-data /var/www/html
	wp core install --url=yel-haya.42.fr --title="yel-haya Website" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST ${REDIS_HOST}  --allow-root
	wp config set WP_REDIS_PORT "6379"  --allow-root
	wp config set WP_REDIS_PASSWORD ${REDIS_PASSWORD}  --allow-root
	wp redis enable --allow-root
fi

/usr/sbin/php-fpm8.4 -F
