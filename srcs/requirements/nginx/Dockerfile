FROM alpine:3.18.5

RUN apk update && apk add nginx && apk add openssl

COPY ./conf/http.d /etc/nginx/http.d
COPY ./tools /etc/nginx/tools

RUN mkdir /etc/nginx/ssl
RUN chmod +x /etc/nginx/tools/nginx.sh


EXPOSE 443

ENTRYPOINT ["/etc/nginx/tools/nginx.sh"]