FROM ubuntu:23.04

ENV JAVA_HOME=/u01/middleware/jdk-11.0.1
ENV TOMCAT_HOME=apache-tomcat-9.0.89
ENV PATH=$PATH:${JAVA_HOME}/bin:${TOMCAT_HOME}/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware

RUN apt update -y
RUN apt install -y openjdk-11-jdk
#RUN https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz .
#RUN https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz .

#RUN -xvzf openjdk-11.0.1_linux-x64_bin.tar.gz
#RUN -xvzf apache-tomcat-9.0.89.tar.gz

#RUN rm openjdk-11.0.1_linux-x64_bin.tar.gz
#RUN rm apache-tomcat-9.0.89.tar.gz

COPY target/corona-1.0.jar /tmp

COPY run.sh /tmp
RUN chmod u+x /tmp/run.sh
WORKDIR /tmp
ENTRYPOINT [ "java -jar corona-1.0.jar" ]
