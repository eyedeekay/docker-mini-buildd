FROM debian:buster
ENV PW changeme
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y mini-buildd
COPY entrypoint.sh /entrypoint.sh
WORKDIR /var/mini-buildd
VOLUME /var/mini-buildd
CMD /entrypoint.sh