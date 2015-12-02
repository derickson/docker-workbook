FROM kibana:4.3.0
# FROM kibana:4.2.1

MAINTAINER Bahaaldine Azarmi <baha@elastic.co>
# egregious hacking by Dave Erickson <dave@elastic.co>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y supervisor curl

# Marvel & Sense
RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest
RUN /opt/kibana/bin/kibana plugin --install kibana/timelion
RUN /opt/kibana/bin/kibana plugin --install elastic/sense

ADD etc/supervisor/conf.d/kibana.conf /etc/supervisor/conf.d/kibana.conf

EXPOSE 5601

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]

