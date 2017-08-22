FROM forumi0721/alpine-armhf-base

MAINTAINER a@rakhnin.com

RUN apk add --update wget ca-certificates && rm -rf /var/cache/apk/*

ADD crontab /opt/crontab
ADD update.sh /opt/update.sh

RUN chmod 755 /opt/update.sh && /usr/bin/crontab /opt/crontab

ENV DOMAIN="localhost"
ENV APIKEY="apikey"

ENTRYPOINT ["/usr/sbin/crond", "-f"]
