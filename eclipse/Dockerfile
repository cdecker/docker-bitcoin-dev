FROM cdecker/bitcoin-dev:latest
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer libxext-dev libxrender-dev libxtst-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN wget http://mirror.netcologne.de/eclipse//technology/epp/downloads/release/luna/SR2/eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz && \
    cd /opt/ && \
    tar -xzf /tmp/eclipse.tar.gz && \
    rm -rf /tmp/*

USER developer
WORKDIR /bitcoin
CMD /opt/eclipse/eclipse

