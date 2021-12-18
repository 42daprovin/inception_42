FROM alpine:3.12

RUN	apk update && apk upgrade && apk add --no-cache \
	mariadb	\
	mariadb-client	\
	curl \
	vim \
	sudo


RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld && chown mysql:mysql /var/lib/mysql
RUN mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

COPY ./src/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chown -R mysql:mysql /etc/my.cnf.d

COPY ./entry /tmp/entry
COPY ./src/mdb.sql /tmp/config/runtime_config.sql
RUN	chown -R mysql:mysql /tmp/config && \
	chown -R mysql:mysql /tmp/entry

USER mysql

WORKDIR /tmp/entry

EXPOSE 3306

ENTRYPOINT [ "sh", "entrypoint.sh" ]
