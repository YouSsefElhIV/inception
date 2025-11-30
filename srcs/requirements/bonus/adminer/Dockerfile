FROM debian:trixie

RUN apt update && apt install adminer -y

COPY ./adminer.conf /etc/apache2/conf-available/adminer.conf

RUN a2enconf adminer.conf

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

