FROM nginx:alpine

RUN apk update && \
    apk upgrade && \
    apk add openssh && \
    apk add curl

RUN addgroup -g 1000 -S www-data \
 && adduser -u 1000 -D -S -G www-data www-data

RUN rm -rf /var/cache/apk/*
