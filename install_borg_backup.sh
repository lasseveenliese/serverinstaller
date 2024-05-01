#!/bin/bash

# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi

# Updates
sudo apt update

# Installieren von Borg und Borgmatic
sudo apt install -y borgbackup
sudo apt install -y pipx
sudo pipx ensurepath
sudo pipx install borgmatic
borgmatic --version
sudo borgmatic config generate

echo "Passe die Datei /etc/borgmatic/config.yaml wie gewünscht an."
echo "Führe dann das Programm install_borg_config.sh mit bash aus."
