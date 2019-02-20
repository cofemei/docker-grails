FROM phusion/baseimage

MAINTAINER George

ENV JAVA_PKG=jdk-8u*-linux-x64.tar.gz \
    JAVA_HOME=/usr/java/default \
    GRAILS_PKG=grails-*.zip \
    PATH=$PATH:/usr/java/default/bin:/usr/grails/default/bin

ADD $JAVA_PKG /usr/java/
ADD $GRAILS_PKG /usr/grails/

RUN apt-get update && apt-get install -y vim curl unzip zip && apt-get autoremove && apt-get clean

RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default

RUN cd /usr/grails/ && \
    unzip -q $GRAILS_PKG && \
    rm /usr/grails/$GRAILS_PKG && \
    export GRAILS_DIR=$(ls -1 -d /usr/grails/*) && \
    ln -s $GRAILS_DIR /usr/grails/default
    

