FROM mhart/alpine-node:4.6
MAINTAINER  Weslley Camilo

ENV TIMEZONE America/Sao_Paulo


RUN apk add --no-cache make gcc g++ python linux-headers libc6-compat bind-tools tzdata && \
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \ 
echo "${TIMEZONE}" > /etc/timezone 