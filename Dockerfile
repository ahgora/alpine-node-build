FROM mhart/alpine-node:4.6
MAINTAINER  Weslley Camilo

ENV TIMEZONE America/Sao_Paulo


RUN apk add --no-cache php5 make gcc g++ python linux-headers libc6-compat bind-tools tzdata && \
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
ln -s /usr/bin/php /usr/bin/php5 && \
echo "${TIMEZONE}" > /etc/timezone && \
npm install -g yarn
