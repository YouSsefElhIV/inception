FROM debian:trixie

RUN apt update && apt install vsftpd -y

ARG FTP_USER
ARG FTP_PASSWORD

RUN useradd -m -d /home/$FTP_USER -s /usr/sbin/nologin $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd && echo "/usr/sbin/nologin" >> /etc/shells

ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
