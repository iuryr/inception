FROM alpine:3.21

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/vsftpd && touch /var/log/vsftpd/vsftpd.log

RUN apk update &&\
	apk add vsftpd --no-cache
	
EXPOSE 21

ENTRYPOINT [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
