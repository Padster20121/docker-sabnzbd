FROM padster2012/docker-base:latest
MAINTAINER Tim Haak <tim@haak.co>

RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes  sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \
    par2 python-yenc unzip unrar nfs-common htop && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/config","/data"]

EXPOSE 8082 9090

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--console","--server", "0.0.0.0:8082"]
