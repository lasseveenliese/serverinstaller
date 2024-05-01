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

# Update Skript erstellen
echo "sudo apt update && sudo apt upgrade -y" > ./update.sh;

# Automatisches Update
if! crontab -l | grep -q "bash ./update.sh"; then
    (crontab -l ; echo "0 4 * * * bash ./update.sh >/dev/null 2>&1") | crontab -
    echo "Cronjob wurde hinzugefügt."
else
    echo "Cronjob existiert bereits."
fi
