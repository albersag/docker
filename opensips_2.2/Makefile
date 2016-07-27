#
# This is a generic Makefile. It use to build Docker images.
#

all: build

build:
	   @docker build -t voipnovatos/opensips
quickstart:
	@echo "Quick starting sample"
	@docker run --name opensips -d -p 5060:5060/udp \
	-e ADVERTISED_IP=“10.0.100.26” \
	voipnovatos/opensips
