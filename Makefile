
PASSWORD=$(shell apg -n 1)

-include config.mk

docker: build

install:
	#dpkg --no-pager -l qemu-user-static || sudo apt-get install qemu-user-static

clean:
	docker rm -f mini-buildd
	
clobber: clean
	sh -c 'ls mini-buildd && sudo rm -rvf mini-buildd'; true

build: install
	docker build -t eyedeekay/mini-buildd .

run: clean
	docker run -d \
		--env PASSWORD=$(PASSWORD) \
		--name mini-buildd \
		--volume $(PWD)/mini-buildd:/var/mini-buildd:rw \
		-p 127.0.0.1:8066:8066 \
		-p 127.0.0.1:8067:8067 \
		eyedeekay/mini-buildd

help: clean
	docker run \
		--rm \
		eyedeekay/mini-buildd \
		mini-buildd -h

less:
	docker run \
		--rm \
		eyedeekay/mini-buildd \
		less /usr/share/doc/mini-buildd/examples/auto-setup


update: build run