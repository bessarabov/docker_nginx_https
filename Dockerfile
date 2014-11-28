FROM ubuntu:14.04

ENV UPDATED_AT 2014-11-28

RUN apt-get update
RUN apt-get install -y \
    nginx \
    openssl

COPY nginx.conf /root/nginx.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

RUN mkdir -p /site/public
RUN echo 'hello' > /site/public/index.html

EXPOSE 443

CMD nginx -c /root/nginx.conf
