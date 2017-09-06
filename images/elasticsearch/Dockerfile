FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.2

#COPY elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch