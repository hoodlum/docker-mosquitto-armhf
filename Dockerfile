FROM hypriot/rpi-alpine

MAINTAINER Soeren Stelzer

ENV VERSION 1.4.12-r0

RUN apk --no-cache add --update \
#    ca-certificates openssl \
    mosquitto \
#    mosquitto-clients \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/{lib,log,run}/mosquitto /etc/mosquitto/conf.d

#COPY mosquitto.config /etc/mosquitto/mosquitto.conf
#RUN chown -R mosquitto:mosquitto /mqtt

EXPOSE 1883 9001

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/mosquitto"]


#CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
