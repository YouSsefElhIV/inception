FROM debian:trixie

RUN apt update && apt install mariadb-client mariadb-server -y

COPY ./mariadb-init.sh /usr/local/bin/mariadb-init.sh

RUN chmod +x /usr/local/bin/mariadb-init.sh

ENTRYPOINT ["/usr/local/bin/mariadb-init.sh"]
