NAME = voipnovatos/kamailio-rpi-dbtext
VERSION = latest

.PHONY: all build run

all: build

build:

        @docker build -t $(NAME):$(VERSION) .         

run:
        @docker run -dt -p 5060:5060 -p 5060:5060/udp -p 5061:5061 -e ADVERTISED_IP="10.0.200.94" --name=kamailio -h "kamailio.local" voipnovatos/kamailio-rpi-dbtext


