FROM alpine:3.17

ENV DEBIAN_FRONTEND=noninteractive WORKDIR /usr/local/src

Packages:
- librist dependencies
- from OBS build instructions:
- build system
- core dependencies
- UI dependencies
- plugin dependencies
- from cudagl Dockerfile
- OBS dependencies
- gRPC
- debug tools (removed in the release image)
RUN apk update
&& apk add --no-cache
meson

cmake ninja clang clang-dev clang-static clang-tools-extra
ccache git curl

ffmpeg-dev ffmpeg-static ffmpeg-libs x264-dev
curl-dev mbedtls-dev mesa-gl libjansson-dev luajit-dev python3-dev
libx11-dev libxcb-dev libxcomposite-dev libxinerama-dev
libxss-dev libglvnd-dev mesa-gles2 mesa-gles2-dev wayland-dev
srt-dev pciutils-dev

qt5-qtbase-dev qt5-qtsvg-dev qt5-qtwayland qt5-qtx11extras-dev
qt6-qtbase-dev qt6-qtsvg-dev qt6-qtwayland qt6-qtx11extras-dev
qtchooser

libasound2-dev fdk-aac-dev fontconfig freetype freetype-dev jack2 jack2-dev pulseaudio pulseaudio-dev sndio sndio-dev speexdsp speexdsp-dev eudev eudev-dev v4l-utils v4l-utils-dev libva libva-utils libva-intel-driver libva-vdpau-driver vlc vlc-plugins-base vlc-plugins-good vlc-plugins-bad vlc-plugins-ugly vlc-plugins-meta vlc-libvlc vlc-libvlc-static vlc-libvlc-devel vlc-libvlccore vlc-libvlccore-static vlc-libvlccore-devel

grpc grpc-cli grpc-c++ grpc-c+±dev grpc-c+±static grpc-c++1 grpc-c++1-static grpc-c++1-debuginfo grpc-c++1-doc grpc-c++1-tools grpc-c++1-tests protobuf protobuf-c protobuf-c++ protobuf-c+±dev protobuf-c+±static protobuf-c++1 protobuf-c++1-static protobuf-c++1-debuginfo protobuf-c++1-doc protobuf-c++1-tools protobuf-c++1-tests

vim gdb valgrind net-tools iptables procps tcpdump linux-tools

Install librist (OBS dependency)
RUN git clone https://code.videolan.org/rist/librist.git
&& cd librist
&& git checkout v0.2.7
&& mkdir build
&& cd build
&& meson …
&& ninja
&& ninja install
