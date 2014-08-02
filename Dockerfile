FROM ubuntu:14.04

MAINTAINER eltimn

ENV APT_GET_UPDATE 2014-08-01_1

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV HOME /root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wget openjdk-7-jdk npm && apt-get clean

RUN npm install -g grunt-cli
RUN npm install -g less

RUN ln -s /usr/bin/nodejs /usr/bin/node

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN wget -O /usr/local/bin/sbt-launch.jar http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.5/sbt-launch.jar

ADD sbt.sh /usr/local/bin/sbt
