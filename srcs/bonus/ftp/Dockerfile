FROM alpine:3.21

ARG FTP_USER
ARG FTP_PASSWORD
ARG FTP_PATH

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/vsftpd && touch /var/log/vsftpd/vsftpd.log

RUN apk update &&\
	apk add vsftpd --no-cache
	
RUN adduser -D -g "" --home /home/$FTP_USER --shell /bin/ash $FTP_USER 
RUN echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

RUN echo -e "\nlocal_root=$FTP_PATH" >> /etc/vsftpd/vsftpd.conf

EXPOSE 21

ENTRYPOINT [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
