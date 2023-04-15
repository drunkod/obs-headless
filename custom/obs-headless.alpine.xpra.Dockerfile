# Define variables for the OBS version and the OS name
ARG OBS_VERSION
ARG OS_NAME

# FROM obs-headless-builder:${OS_NAME}-obs-${OBS_VERSION}

FROM ghcr.io/drunkod/obs-headless-builder:alpine-builder-latest


RUN apk add --no-cache --update py3-paramiko py3-cairo py3-netifaces py3-zeroconf 
# py3-avahi
RUN apk add --no-cache --update xpra xpra-openrc dbus-x11 xhost xpra-webclient

RUN apk add --no-cache xterm
RUN cp /etc/xpra/xorg.conf /etc/X11/xorg.conf.d/00_xpra.conf
RUN echo "xvfb=Xorg" >> /etc/xpra/xpra.conf

ENV XPRA_DISPLAY=":100"

ARG XPRA_PORT=10000
ENV XPRA_PORT=$XPRA_PORT
EXPOSE $XPRA_PORT

COPY run_in_xpra /usr/bin/run_in_xpra

CMD ["run_in_xpra", "xterm -background white"]

# https://mybyways.com/blog/running-linux-gui-applications-in-a-docker-container-using-xpra
# work with https codespaces server in chrome xdg-open http://localhost:10000/ in https://github.com/Xpra-org/xpra-html5 client
# todo how work in local host without https
