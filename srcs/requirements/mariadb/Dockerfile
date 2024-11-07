FROM debian:12

RUN apt update \
	&& apt install mariadb-server -y

RUN	mkdir -p /run/mysqld
RUN	chown -R mysql:mysql /run/mysqld
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/db.sh /usr/local/bin/m_db
RUN chmod +x /usr/local/bin/m_db


CMD ["m_db"]