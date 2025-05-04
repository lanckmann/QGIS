# .ci/Dockerfile
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential cmake git python3 python3-pyqt5 \
    qtbase5-dev libqt5svg5-dev \
    gdal-bin libgdal-dev proj-bin libproj-dev \
    ccache && rm -rf /var/lib/apt/lists/*

WORKDIR /root/QGIS

# 1. Clone QGIS (release alignée sur upstream)
RUN git clone --branch release-3_28 https://github.com/qgis/QGIS.git .

# 2. Configure et build
RUN mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make -j$(nproc)
