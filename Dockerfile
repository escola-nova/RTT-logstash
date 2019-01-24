# Specify the logstash base image
FROM docker.elastic.co/logstash/logstash:6.5.4

COPY ./private/rtt-logstash.json /usr/share/keys/key.json
COPY ./private/rtt-logstash.p12 /usr/share/keys/key.p12
COPY ./rtt-logstash.conf /usr/share/logstash/pipeline/

RUN logstash-plugin install logstash-input-google_pubsub
RUN logstash-plugin install logstash-output-google_cloud_storage

