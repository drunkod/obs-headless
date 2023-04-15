ARG OBS_VERSION
ARG OS_NAME

# FROM ghcr.io/drunkod/obs-headless-base:${OS_NAME}-base-${OBS_VERSION}
FROM ghcr.io/drunkod/obs-headless-base:alpine-base-latest

# Install necessary packages for building libobs-opengl
RUN apk add --no-cache mesa-dev mesa-dri-gallium mesa-egl mesa-gl mesa-gles libdrm libdrm-dev wayland-dev libx11-dev \
	wayland-libs-egl musl wayland-libs-client libx11 obs-studio
RUN apk info mesa-gl obs-studio

# Build OBS from sources
ENV OBS_BUILD_PATH="./build"
ENV OBS_INSTALL_PATH="usr/share/obs"

# ARG OBS_VERSION

# RUN git clone --branch ${OBS_VERSION} --recursive https://github.com/obsproject/obs-studio.git \
# 	&& cd obs-studio \
# 	&& cmake -S . \
# 		-B ${OBS_BUILD_PATH} \
# 		-G Ninja \
# 		-DCEF_ROOT_DIR="../obs-build-dependencies/cef_binary_5060_linux64" \
# 		-DLINUX_PORTABLE=ON \
# 		-DENABLE_BROWSER=OFF \
# 		-DENABLE_PIPEWIRE=OFF \
# 		-DENABLE_AJA=OFF \
# 		-DENABLE_LIBFDK=ON \
# 	&& cmake --build ${OBS_BUILD_PATH} \
# 	&& cmake --install ${OBS_BUILD_PATH} --prefix ${OBS_INSTALL_PATH}
