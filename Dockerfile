FROM hypriot/rpi-alpine

ENV VERSION 1.4.12-r0

RUN apk --no-cache add --update \
    mosquitto \
    && rm -rf /var/cache/apk/* \

COPY config /etc/mosquitto/mosquitto.conf:ro

RUN chown -R mosquitto:mosquitto /mqtt

EXPOSE 1883 9001

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/mosquitto"]


#CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
