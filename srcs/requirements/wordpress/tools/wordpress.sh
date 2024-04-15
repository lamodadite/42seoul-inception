#!/bin/sh

#set -e

cd /var/lib/nginx/wordpress

if [ ! -f /var/lib/nginx/wordpress/index.php ]; then
	wp core download --path=/var/lib/nginx/wordpress --locale=ko_KR
fi

if [ ! -f /var/lib/nginx/wordpress/wp-config.php ]; then
	wp core config --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST
	wp core install --url=$WORDPRESS_URL --title="Inception" --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PWD --admin_email=$WORDPRESS_ADMIN_EMAIL
	wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=subscriber --user_pass=$WORDPRESS_USER_PWD
fi

if [ -z $(getent passwd wordpress) ]; then
	adduser -D wordpress
fi

chown -R wordpress:wordpress .
chmod -R 755 .

exec php-fpm81 -F;