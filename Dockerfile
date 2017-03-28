FROM mhart/alpine-node:4.6
MAINTAINER  Weslley Camilo

ENV TIMEZONE America/Sao_Paulo

RUN apk add --no-cache make gcc g++ python linux-headers libc6-compat bind-tools tzdata && \
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
ln -s /usr/bin/php /usr/bin/php5 && \
echo "${TIMEZONE}" > /etc/timezone && \
npm install -g yarn

# Pacotes PHP para rodar scripts do redisbatch
RUN apk update && apk upgrade && \
apk add php5 php5-gettext php5-cgi php5-gd php5-intl php5-iconv php5-mcrypt patch php5-imap php5-json php5-curl php5-xml php5-soap php5-dom php5-calendar wget php5-openssl &&\
apk add fabric --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted &&\
apk add --update --no-cache libgcc libstdc++ libx11 glib libxrender libxext libintl ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family zip openssl &&\
apk update && apk add wget ca-certificates &&\
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-php5-mongo/master/sgerrand.rsa.pub &&\
wget https://github.com/sgerrand/alpine-pkg-php5-mongo/releases/download/1.16.4-r0/php5-mongo-1.6.14-r0.apk --no-check-certificate &&\
apk add php5-mongo-1.6.14-r0.apk --allow-untrusted &&\
rm php5-mongo-1.6.14-r0.apk
