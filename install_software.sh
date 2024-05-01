#!/bin/bash

# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi

# Programme installieren
if apt update >/dev/null; then
    echo "Update erfolgreich."
else
    echo "Fehler beim Update."
fi

if apt upgrade -y >/dev/null; then
    echo "Upgrade erfolgreich."
else
    echo "Fehler beim Upgrade."
fi

if apt install -y vim nano git wget curl unzip cron gawk >/dev/null; then
    echo "Installation der Programme erfolgreich."
else
    echo "Fehler bei der Installation der Programme."
fi
