# Define variables for the OBS version and the OS name
ARG OBS_VERSION
ARG OS_NAME

# FROM obs-headless-builder:${OS_NAME}-obs-${OBS_VERSION}

FROM ghcr.io/drunkod/obs-headless-builder:alpine-builder-latest


RUN apk add --no-cache --update py3-paramiko py3-cairo py3-netifaces py3-zeroconf 

RUN apk add --no-cache --update xpra xpra-openrc dbus-x11 xhost xpra-webclient

RUN apk update \
&& apk add --no-cache py3-avahi --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main/


RUN apk add --no-cache xterm py3-xdg
RUN cp /etc/xpra/xorg.conf /etc/X11/xorg.conf.d/00_xpra.conf
RUN echo "xvfb=Xorg" >> /etc/xpra/xpra.conf

ENV XPRA_DISPLAY=":100"

ARG XPRA_PORT=8080
ENV XPRA_PORT=$XPRA_PORT
EXPOSE $XPRA_PORT 6000

COPY custom/run_in_xpra /usr/bin/run_in_xpra

RUN chmod +x /usr/bin/run_in_xpra

# CMD ["run_in_xpra", "obs"]
CMD ["/bin/sh"]

# https://mybyways.com/blog/running-linux-gui-applications-in-a-docker-container-using-xpra
# work with https codespaces server in chrome xdg-open http://localhost:10000/ in https://github.com/Xpra-org/xpra-html5 client
# todo how work in local host without https
