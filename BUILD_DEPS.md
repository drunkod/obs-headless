    BUILD_DEPS=(
        "build-deps cmake ninja-build pkg-config clang clang-format build-essential curl ccache"
        
        "obs-deps libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev \
         libswscale-dev libx264-dev libcurl4-openssl-dev libmbedtls-dev libgl1-mesa-dev libjansson-dev \
         libluajit-5.1-dev python3-dev libx11-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xinerama0-dev \
         libxcb-composite0-dev libxinerama-dev libxcb1-dev libx11-xcb-dev libxcb-xfixes0-dev swig libcmocka-dev \
         libpci-dev libxss-dev libglvnd-dev libgles2-mesa libgles2-mesa-dev libwayland-dev libxkbcommon-dev"
        
        "qt5-deps qtbase5-dev qtbase5-private-dev libqt5svg5-dev qtwayland5"
        
        "qt6-deps qt6-base-dev qt6-base-private-dev libqt6svg6-dev qt6-wayland"
        
        "cef ${LINUX_CEF_BUILD_VERSION:-${CI_LINUX_CEF_VERSION}}"
        
        "plugin-deps libasound2-dev libfdk-aac-dev libfontconfig-dev libfreetype6-dev libjack-jackd2-dev \
         libpulse-dev libsndio-dev libspeexdsp-dev libudev-dev libv4l-dev libva-dev libvlc-dev libdrm-dev \
         nlohmann-json3-dev libwebsocketpp-dev libasio-dev"
    )