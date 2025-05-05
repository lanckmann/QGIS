#!/usr/bin/env bash
# scripts/vnc-start.sh

# 1) Démarre un serveur X virtuel
Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

# 2) Lance un gestionnaire de fenêtres léger
fluxbox &

# 3) (Optionnel) Lance QGIS automatiquement pour tester le GUI
# /root/QGIS/build/bin/qgis &

# 4) Démarre x11vnc pour exposer le DISPLAY :99 sur le port 5900
x11vnc -forever -nopw -create
