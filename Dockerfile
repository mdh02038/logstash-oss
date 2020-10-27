FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget gnupg2
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main > /etc/apt/sources.list.d/elastic-oss-7.x.list
RUN apt-get update && apt-get install -y apt-transport-https default-jre
RUN apt-get install -y logstash-oss

COPY logstash.conf /pipeline/
WORKDIR /pipeline
VOLUME /pipeline

ENTRYPOINT ["/usr/share/logstash/bin/logstash"]
CMD ["-f", "/pipeline/"]

