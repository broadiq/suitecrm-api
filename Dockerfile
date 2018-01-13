FROM openjdk:latest
MAINTAINER John Lutz <jlutz@broadiq.com>

ENV BOOTAPP_USR bootapp
ENV BOOTAPP_GROUP bootapp_group
ENV BOOTAPP_PATH /app.jar
ENV BOOTAPP_DATA_VOLUME /data
ENV SERVER_PORT 80


COPY suitecrm.api-0.1.0.jar app.jar
COPY startup.sh /startup.sh

RUN groupadd -r $BOOTAPP_GROUP && useradd -r -g $BOOTAPP_GROUP $BOOTAPP_USR && chmod 555 /startup.sh

RUN chmod 555 $BOOTAPP_PATH && touch $BOOTAPP_PATH


VOLUME /tmp
VOLUME $BOOTAPP_DATA_VOLUME

USER $BOOTAPP_USR


EXPOSE $SERVER_PORT

ENTRYPOINT [/startup.sh]

