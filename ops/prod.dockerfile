FROM alpine:3.8

RUN apk add --update --no-cache bash certbot iputils nginx openssl && \
    openssl dhparam -out /etc/ssl/dhparam.pem 2048 && \
    ln -fs /dev/stdout /var/log/nginx/access.log && \
    ln -fs /dev/stdout /var/log/nginx/error.log

COPY ops/nginx.conf /etc/nginx/nginx.conf
COPY ops/entry.sh /root/entry.sh
COPY build /var/www/html

ENTRYPOINT ["bash", "/root/entry.sh"]
