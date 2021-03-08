FROM alpine:3.13
LABEL maintainer="Nate Wilken <wilken@asu.edu>"

RUN apk update \
 && apk add --no-cache bash less curl jq python3 groff \
 && apk add --no-cache --virtual .build-deps py3-pip \
 && pip3 install --no-cache-dir --upgrade pip awscli s3cmd \
 && apk del --purge --no-cache .build-deps \
 && rm -rf /root/.cache
