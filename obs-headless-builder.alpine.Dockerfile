ARG OBS_VERSION
ARG OS_NAME

# FROM ghcr.io/drunkod/obs-headless-base:${OS_NAME}-base-${OBS_VERSION}
FROM ghcr.io/drunkod/obs-headless-base:alpine-base-latest

# Install necessary packages for building libobs-opengl
RUN apk add --no-cache mesa-dev mesa-dri-gallium mesa-egl mesa-gl mesa-gles libdrm libdrm-dev wayland-dev libx11-dev \
	wayland-libs-egl musl wayland-libs-client libx11 
RUN apk update \
&& apk add --no-cache obs-studio --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/


RUN apk info mesa-gl obs-studio

# Build OBS from sources
# ENV OBS_BUILD_PATH="./build"
# ENV OBS_INSTALL_PATH="usr/share/obs"

# ARG OBS_VERSION


# # Clones OBS Studio repository from GitHub using a specific version 
# RUN git clone --branch ${OBS_VERSION} --recursive https://github.com/obsproject/obs-studio.git \
#     # Changes directory to obs-studio 
#     && cd obs-studio \
# 	# Runs CMake with various build configurations using Ninja as the generator 
#     && cmake -S . \
#         -B ${OBS_BUILD_PATH} \
#         -G Ninja \
#         # Instructs CMake to utilize a specific Chromium Embedded Framework (CEF) binary 
#         -DCEF_ROOT_DIR="../obs-build-dependencies/cef_binary_5060_linux64" \
#         # Enables portability for Linux 
#         -DLINUX_PORTABLE=ON \
#         # Disables OBS Studio Browser functionality 
#         -DENABLE_BROWSER=OFF \
#         # Disables PipeWire and AJA 
#         -DENABLE_PIPEWIRE=OFF \
#         -DENABLE_AJA=OFF \
#         # Enables support for the FDK-AAC library 
#         -DENABLE_LIBFDK=ON \
#     # Builds the project 
#     && cmake --build ${OBS_BUILD_PATH} \
#     # Installs the built project to the specified installation path 
#     && cmake --install ${OBS_BUILD_PATH} --prefix ${OBS_INSTALL_PATH}

