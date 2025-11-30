FROM debian:trixie

RUN apt update && apt install redis-server -y

COPY ./redis.conf /etc/redis/redis.conf

COPY ./redis-init.sh .

RUN chmod +x ./redis-init.sh

RUN chmod +x /etc/redis/redis.conf

ENTRYPOINT ["./redis-init.sh"]
