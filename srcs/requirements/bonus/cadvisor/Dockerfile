FROM debian:trixie

RUN apt update && apt install wget -y

RUN wget https://github.com/google/cadvisor/releases/download/v0.53.0/cadvisor-v0.53.0-linux-amd64

RUN chmod +x cadvisor-v0.53.0-linux-amd64

RUN mv cadvisor-v0.53.0-linux-amd64 /usr/local/bin/

ENTRYPOINT ["./usr/local/bin/cadvisor-v0.53.0-linux-amd64"]
