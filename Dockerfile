FROM ubuntu:14.04
RUN apt-get update;\
	apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev wget bsdmainutils libqrencode-dev libqt4-dev libprotobuf-dev protobuf-compiler git-core openjdk-7-jdk gdb;\
	apt-get clean;\
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD bdb.sh /tmp/
RUN chmod +x /tmp/bdb.sh; /tmp/bdb.sh
RUN wget "http://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-1.6.tar.gz" -O miniupnpc-1.6.tar.gz;\
	tar -xzvf miniupnpc-1.6.tar.gz; \
	cd miniupnpc-1.6; \
	make; \
	make install; \
	cd /; \
	rm -rf /miniupnpc-1.6;rm miniupnpc-1.6.tar.gz
RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer
ENV HOME /home/developer
RUN mkdir /bitcoin; chown -R developer:developer /bitcoin
WORKDIR /bitcoin
