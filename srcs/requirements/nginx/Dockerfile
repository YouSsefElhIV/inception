FROM debian:trixie

RUN apt update && apt install nginx -y && apt install openssl -y

RUN mkdir -p /etc/nginx/tls

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/tls/private_key.pem -out /etc/nginx/tls/certificate.crt -subj "/C=US/ST=State/L=City/O=Company/OU=IT/CN=yel-haya.42.fr/emailAddress=yel-haya@yel-haya.42.fr"

COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
