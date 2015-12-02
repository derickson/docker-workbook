FROM java:8-jre

RUN apt-get update
RUN apt-get install -y wget

ENV ES_VERSION 2.1.0
WORKDIR /opt
RUN wget -O- https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/elasticsearch-2.1.0.tar.gz | tar xvfz -

# ENV ES_VERSION 2.0.0
# WORKDIR /opt
# RUN wget -O- http://download.elasticsearch.org/elasticsearch/staging/2.0.0-de54438/org/elasticsearch/distribution/tar/elasticsearch/2.0.0/elasticsearch-$ES_VERSION.tar.gz | tar xvfz -


RUN mv /opt/elasticsearch-$ES_VERSION /opt/elasticsearch


RUN /opt/elasticsearch/bin/plugin -Des.plugins.staging=true install license
# RUN /opt/elasticsearch/bin/plugin -Des.plugins.staging=true install shield
# RUN /opt/elasticsearch/bin/plugin -Des.plugins.staging=true install watcher
RUN /opt/elasticsearch/bin/plugin -Des.plugins.staging=true install marvel-agent
RUN /opt/elasticsearch/bin/plugin install derickson/elastic-workbook

VOLUME /data
VOLUME /config

ENV ES_JAVA_OPTS -Des.path.conf=/config

RUN addgroup elasticsearch && adduser --ingroup elasticsearch --disabled-password --gecos '' elasticsearch && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
RUN chown -R elasticsearch  /opt/ | chown -R elasticsearch  /data/ | chown -R elasticsearch  /config/


WORKDIR /opt/elasticsearch/bin
USER elasticsearch

CMD ["/opt/elasticsearch/bin/elasticsearch"]
