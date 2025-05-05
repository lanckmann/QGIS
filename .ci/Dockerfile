# 1. Base image
FROM ubuntu:22.04

# 2. Activer le dépôt universe et installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y \
      build-essential \
      cmake \
      git \
      python3 \
      python3-pyqt5 \
      qtbase5-dev \
      qtlocation5-dev \
      qtpositioning5-dev \
      libqt5svg5-dev \
      libqt5serialport5-dev \
      qtwebengine5-dev \
      gdal-bin \
      libgdal-dev \
      proj-bin \
      libproj-dev \
      ccache \
      flex \
      bison \
      pkg-config \
      libzip-dev \
      protobuf-compiler \
      libprotobuf-dev \
      libexiv2-dev \
      libspatialindex-dev \
      libqscintilla2-qt5-dev \
      xvfb \
      x11vnc \
      fluxbox \
    && rm -rf /var/lib/apt/lists/*

# 3. Préparer le répertoire de travail
WORKDIR /root/QGIS

# 4. Cloner la branche QGIS ciblée
RUN git clone --branch release-3_28 https://github.com/qgis/QGIS.git .

# 5. Créer et configurer le build
RUN mkdir build && cd build && \
    cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_QTWEBENGINE=ON \
      -DWITH_QT5=ON \
      -DENABLE_TESTS=OFF \
    && make -j$(nproc)

# 6. Script de démarrage X11/VNC (à monter en volume)
COPY scripts/vnc-start.sh /usr/local/bin/vnc-start.sh
RUN chmod +x /usr/local/bin/vnc-start.sh

# 7. Commande par défaut : lancer Xvfb + VNC pour tests graphiques
ENTRYPOINT ["/usr/local/bin/vnc-start.sh"]
