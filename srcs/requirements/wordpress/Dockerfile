FROM debian:trixie

RUN apt update && apt install mariadb-client php8.4-mysql -y && apt install php8.4-fpm php-cli php8.4-cli -y && apt install wget -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./wordpress-init.sh /usr/local/bin/wordpress-init.sh

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R +777 /var/www/html

RUN chmod +x /usr/local/bin/wordpress-init.sh

ENTRYPOINT ["/usr/local/bin/wordpress-init.sh"]


