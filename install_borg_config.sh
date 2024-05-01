#!/bin/bash

# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi

sudo borgmatic config validate
sudo borgmatic rcreate --encryption repokey-aes-ocb

echo "Jetzt wird ein Backup erstellt. Das kann etwas dauern."

sudo borgmatic create --verbosity 1 --list --stats
