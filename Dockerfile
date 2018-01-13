FROM openjdk:latest

MAINTAINER Etienne Koekemoer <me@etiennek.com>

ENV SERVER_PORT 80

VOLUME /tmp
ADD suitecrm.api-0.1.0.jar app.jar


EXPOSE $SERVER_PORT


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
