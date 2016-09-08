FROM viossat/keeweb:latest
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

RUN apk add --no-cache \
	apache2-utils \
	lighttpd-mod_auth \
	lighttpd-mod_webdav

COPY 20-webdav.sh $START_PATH
COPY 20-webdav.conf $CONF_PATH
