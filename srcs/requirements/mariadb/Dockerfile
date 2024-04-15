FROM alpine:3.18.5

RUN apk update && apk add mariadb mariadb-client

COPY ./conf/my.cnf.d /etc/my.cnf.d
COPY ./tools /tools

EXPOSE 3306

ENTRYPOINT ["./tools/mariadb.sh"]