FROM debian:12

RUN apt-get update && \
	apt-get install -y nginx && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/mynginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/mynginx.conf /etc/nginx/sites-enabled/mynginx.conf

RUN apt update && \
	apt install openssl -y && \
	mkdir -p /ssl && \
	openssl genrsa -out /ssl/private.rsa 2048 && \
	openssl req -new -key /ssl/private.rsa -out /ssl/request.csr -subj "/CN=$URL" && \
	openssl x509 -req -in /ssl/request.csr -signkey /ssl/private.rsa -out /ssl/certificate.crt -days 365


CMD ["nginx", "-g", "daemon off;"]