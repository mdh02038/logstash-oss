FROM ubuntu:18.04

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main | sudo tee  /etc/apt/sources.list.d/elastic-oss-7.x.list

RUN \
  apt update &&
  apt install apt-transport-https default-jre logstash

COPY logstash.conf /logstash/
WORKDIR /logstash
VOLUME /logstash

ENTRYPOINT ["/usr/share/logstash/bin/logstash"]
CMD ["-f", "/logstash/logstash.conf"]

