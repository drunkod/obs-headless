# Define variables for the OBS version and the OS name
ARG OBS_VERSION
ARG OS_NAME

# Use obs-headless-builder as the parent image
FROM obs-headless-builder:${OS_NAME}-obs-${OBS_VERSION}

# Set the environment variable for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive
# Set the working directory to /usr/local/src
WORKDIR /usr/local/src

# Define the installation path for obs-headless
ENV OBS_HEADLESS_INSTALL_PATH="/opt/obs-headless"
# Copy the source code from the current directory to the image
COPY src/ /usr/local/src/obs-headless
# Run commands to build obs-headless
RUN cd obs-headless \
	\
	&& echo -e "\033[32mGenerating proto files...\033[0m" \
	&& cd proto_gen/ \
	&& sh proto_gen.sh \
	&& cd .. \
	\
	&& echo -e "\033[32mPreparing build...\033[0m" \
	&& mkdir -p build \
	&& cd build \
	&& cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${OBS_HEADLESS_INSTALL_PATH}" \
		-DCMAKE_INSTALL_RPATH="${OBS_HEADLESS_INSTALL_PATH}/lib" \
		-DOBS_INSTALL_PATH="${OBS_INSTALL_PATH}" \
	\
	&& echo -e "\033[32mBuilding...\033[0m" \
	&& make -j$(nproc) \
	&& make install

# Copy the configuration files from the current directory to the image
COPY etc/ /opt/obs-headless/etc

# Define the default command to run when the container is started
ENTRYPOINT ["/opt/obs-headless/etc/docker-entrypoint.sh"]
