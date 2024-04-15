FROM alpine:3.18.5

RUN apk update && apk add php && apk add php-fpm && apk add php-mysqli && \
	apk add php-phar && apk add php-mbstring && apk add php-tokenizer && \
	apk add php-ctype && apk add curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools ./tools

RUN chmod +x ./tools/wordpress.sh

EXPOSE 9000

ENTRYPOINT ["./tools/wordpress.sh"]