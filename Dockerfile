FROM viossat/keeweb:latest
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

RUN apk add --no-cache \
	apache2-utils \
	lighttpd-mod_auth \
	lighttpd-mod_webdav

COPY webdav.conf /etc/lighttpd
COPY webdav.sh $START_PATH

RUN echo 'include "webdav.conf"' >> /etc/lighttpd/lighttpd.conf \
	&& sed -i '/server.modules = (/a\    "mod_auth",\'$'\n    "mod_webdav",' /etc/lighttpd/lighttpd.conf
