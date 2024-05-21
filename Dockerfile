FROM ubuntu:23.04

ENV JAVA_HOME=/u01/middleware/jdk-11.0.2
#ENV TOMCAT_HOME=apache-tomcat-9.0.89
ENV PATH=$PATH:$JAVA_HOME/bin

RUN mkdir -p /u01/middleware
RUN mkdir -p /u01/apps
WORKDIR /u01/middleware

RUN https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz .
#RUN https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz .

RUN tar -xvzf openjdk-11.0.2_linux-x64_bin.tar.gz
#RUN -xvzf apache-tomcat-9.0.89.tar.gz

RUN rm openjdk-11.0.2_linux-x64_bin.tar.gz
#RUN rm apache-tomcat-9.0.89.tar.gz

RUN mkdir -p /u01/apps
COPY target/corona-1.0.jar .

#COPY run.sh /tmp
#RUN chmod u+x /tmp/run.sh
ENTRYPOINT [ "bash","java -jar corona-1.0.jar" ]
