FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install git build-essential autoconf libtool pkg-config libmnl-dev libyaml-dev libssl-dev libsctp-dev iproute2

RUN git clone https://github.com/open5gs/open5gs.git /opt/open5gs && \
    cd /opt/open5gs && \
    autoreconf -fi && \
    ./configure --prefix=/usr/local --sysconfdir=/usr/local/etc && \
    make -j`nproc` && \
    make install

EXPOSE 2152/udp 80/tcp 443/tcp

CMD ["./usr/local/bin/open5gs"]

