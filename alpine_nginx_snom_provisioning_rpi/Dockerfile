FROM armhf/alpine

RUN apk --update add --no-cache pcre-dev openssl-dev openssl zlib-dev curl nginx joe

#RUN ln -sf /dev/stdout /data/log/nginx/access.log 

#RUN ln -sf /dev/stderr /data/log/nginx/error.log

COPY etc/nginx.conf /etc/nginx/nginx.conf

COPY etc/local.conf /etc/nginx/conf.d/local.conf

RUN mkdir -p /etc/nginx/ssl 

RUN openssl genrsa -out /etc/nginx/ssl/dummy.key 2048 

RUN openssl req -new -key /etc/nginx/ssl/dummy.key -out /etc/nginx/ssl/dummy.csr -subj "/C=DE" 

RUN openssl x509 -req -days 3650 -in /etc/nginx/ssl/dummy.csr -signkey /etc/nginx/ssl/dummy.key -out /etc/nginx/ssl/dummy.crt

COPY etc/certs.crt /etc/nginx/ssl/certs.crt

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

