FROM registry.fedoraproject.org/fedora:latest

RUN curl -Lf https://github.com/jedisct1/dnsblast/archive/refs/heads/master.zip -o /var/tmp/master.zip
RUN dnf install -y unzip gcc make
RUN unzip /var/tmp/master.zip -d /var/tmp/
RUN cd /var/tmp/dnsblast-master && make
RUN cp /var/tmp/dnsblast-master/dnsblast /usr/bin/
RUN cd / && rm -rf /var/tmp/* && dnf erase -y gcc make

COPY dns-blast /
    
CMD ["sh", "dns-blast"]
