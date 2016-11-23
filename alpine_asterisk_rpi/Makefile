NAME = voipnovatos/alpine-asterisk-rpi
VERSION = latest

.PHONY: all build run

all: build

build:

	docker build -t $(NAME):$(VERSION) .         
        
run:

	docker run -dt -p 5080:5060/udp -p 5081:5061 --name=asterisk -h "asterisk.local" voipnovatos/alpine-asterisk-rpi
                
                
                