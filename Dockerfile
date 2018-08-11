FROM ubuntu:18.10
MAINTAINER jacosta jacostapingo@gmail.com
RUN apt-get update && apt-get install -y software-properties-common && apt-get -y install curl
RUN \
  apt-get update && \
     apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN mkdir /opt/intalador_bamboo
WORKDIR /opt/intalador_bamboo
RUN curl -SLO https://product-downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-6.6.0.tar.gz > atlassian-bamboo-6.6.0.tar.gz && tar -xzvf atlassian-bamboo-6.6.0.tar.gz && mkdir /opt/bamboo && cp -r atlassian-bamboo-6.6.0/* /opt/bamboo
CMD ["/opt/bamboo/bin/start-bamboo.sh", "-fg"]