FROM debian:trixie

RUN apt update && apt install nginx -y

COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
