#!/bin/sh

while ! mariadb -h${MYSQL_HOST} -P${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASSWORD}; do 
	echo "db starting..."
	sleep 1; 
done

if [ "$(mariadb -h${MYSQL_HOST} -P${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "USE $MYSQL_DATABASE; SHOW TABLES;")" == "" ]; then
	wp core install --url=${DOMAIN_NAME} --title=${WP_TITTLE} --admin_user=${WP_ADM_USER} --admin_password=${WP_ADM_PWD} --admin_email=${WP_ADM_EMAIL} --skip-email
	wp theme install twentytwentyone --activate
	wp plugin update --all
	wp user create antonio antonio@antonio.com --role=author --user_pass=antonio
	wp post create --post_title="Tengo un problema" --post_content="hola" --post_status=publish --post_author="antonio"
fi

php-fpm7 -F -R
