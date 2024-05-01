#!/bin/bash

# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi

# Updates und Upgrades
sudo apt update
sudo apt upgrade -y

# Software installieren
sudo apt install -y vim nano git wget curl unzip cron gawk
