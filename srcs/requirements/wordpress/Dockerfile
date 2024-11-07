FROM debian:12

RUN apt update \
	&& apt install -y php-fpm php-mysql curl \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/php.sh /usr/local/bin/wp_cgi
RUN chmod +x /usr/local/bin/wp_cgi

RUN apt install mariadb-client -y

CMD ["wp_cgi"]