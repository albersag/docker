FROM armhf/alpine

RUN apk --update add --no-cache asterisk asterisk-curl asterisk-speex asterisk-sample-config asterisk-srtp curl joe

RUN rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN asterisk && sleep 5

#COPY etc/nginx.conf /etc/nginx/nginx.conf

#COPY etc/local.conf /etc/nginx/conf.d/local.conf

EXPOSE 5060/udp 5061

ENTRYPOINT ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root","-p"]

