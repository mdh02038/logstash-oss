FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    apt-transport-https \
    default-jre \
    gosu
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main > /etc/apt/sources.list.d/elastic-oss-7.x.list
RUN apt-get update && apt-get install -y logstash-oss

COPY logstash.conf /pipeline/
COPY docker-entrypoint.sh /usr/bin
RUN ln -s /usr/share/logstash/bin/logstash /usr/bin
WORKDIR /pipeline
VOLUME /pipeline

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["logstash", "-f", "/pipeline/"]

