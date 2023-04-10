FROM alpine:3.17

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /usr/local/src

RUN apk add --no-cache \
    meson \
    \
    cmake ninja pkgconf clang clang-format build-base curl \
    ccache git \
    \
    ffmpeg-dev libx264-dev libcurl libcurl-dev mbedtls-dev libjansson-dev \
    luajit-dev python3-dev libx11-dev \
    \
    qt5-qtbase-dev qt5-qtsvg-dev qt5-qtx11extras-dev qt5-qtwayland \
    \
    alsa-lib-dev fdk-aac-dev fontconfig-dev freetype-dev jack-dev \
    pulseaudio-dev speexdsp-dev udev-dev v4l-utils-dev vlc-dev \
    \
    grpc++ grpc-dev protobuf-dev \
    \
    vim gdb valgrind net-tools iptables procps tcpdump \
    linux-tools

# Install librist (OBS dependency)
RUN git clone https://code.videolan.org/rist/librist.git \
    && cd librist \
    && git checkout v0.2.7 \
    && mkdir build \
    && cd build \
    && meson .. \
    && ninja \
    && ninja install
