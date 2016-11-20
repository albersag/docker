NAME = voipnovatos/alpine-nginx-provisioning-snom-rpi
VERSION = latest

.PHONY: all build run

all: build

build:

	docker build -t $(NAME):$(VERSION) .         
        
run:

	docker run -dt -p 80:80 -p 443:443 --name=kamailio -h "kamailio.local" -v /home/pirate/xml:/var/www/localhost/htdocs voipnovatos/alpine-nginx-provisioning-snom-rpi 
                
                
                