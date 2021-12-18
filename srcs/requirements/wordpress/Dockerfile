FROM alpine:3.12

RUN	apk update && apk upgrade && apk add --no-cache \
						php7 	\
						php7-fpm	\
						php7-phar	\
						php7-json	\
						php7-mysqli	\
						php7-curl	\
						php7-iconv	\
						php7-pecl-mailparse	\
						curl	\
						mariadb-client		\
						bash			\
						wget			\
						curl			\
						vim			\
						sudo

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar &&	\
	cp wp-cli.phar /usr/bin/wp 

WORKDIR		/var/www/wordpress

ENV	MYSQL_HOST="db"		\
	WP_URL="daprovin.42.fr"

RUN	wp core download

RUN	adduser -S nginx && \
	addgroup -S nginx

RUN	mkdir /var/log/php-fpm 
COPY	./src/php-fpm.conf /etc/php7/php-fpm.conf
COPY	./src/www.conf /etc/php7/php-fpm.d/www.conf

COPY	./src /config
COPY	./src/wp-config.php ./
COPY	./entry /tmp/scripts
RUN	chmod -R +x /tmp/scripts

EXPOSE	9000

ENTRYPOINT ["bash", "/tmp/scripts/entrypoint.sh"]
