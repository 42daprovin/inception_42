FROM		alpine:3.12

RUN	apk update && apk upgrade && apk add --no-cache	\
	openssl	\
	nginx	\
	curl	\
	vim	\
	sudo

RUN	rm -f /etc/nginx/nginx.conf
COPY	./src/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir /run/nginx &&	\
	chown nginx:nginx /run/nginx

ENV	DOMAIN_NAME=daprovin.42.fr	\
	CERTS_DIR=/etc/openssl	\
	CERT_PATH=/etc/ssl/daprovin.42.fr.cert	\
	KEY_PATH=/etc/ssl/daprovin.42.fr.key	\
	PHP_FPM_HOST=php-fpm	\
	PHP_FPM_PORT=9000	\
	TLS_VERSION=1.3

COPY	entry/entrypoint.sh /entrypoint.sh
RUN	chmod -R +x /entrypoint.sh

EXPOSE	443

ENTRYPOINT	["sh", "entrypoint.sh"]
