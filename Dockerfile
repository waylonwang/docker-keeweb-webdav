FROM viossat/keeweb:latest
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

RUN apk add --no-cache \
	lighttpd-mod_auth \
	lighttpd-mod_webdav \
	apache2-utils

COPY webdav.conf /etc/lighttpd
COPY webdav.sh $START_PATH

RUN echo 'include "webdav.conf"' >> /etc/lighttpd/lighttpd.conf
RUN sed -i '/server.modules = (/a\    "mod_auth",\'$'\n    "mod_webdav",' /etc/lighttpd/lighttpd.conf
