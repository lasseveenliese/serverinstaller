#!/bin/bash

# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi

# Programme installieren
if sudo apt update >/dev/null; then
    echo "Update erfolgreich."
else
    echo "Fehler beim Update."
fi

if sudo apt upgrade -y >/dev/null; then
    echo "Upgrade erfolgreich."
else
    echo "Fehler beim Upgrade."
fi

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

curl -fsSL https://test.docker.com -o test-docker.sh
sudo sh test-docker.sh

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

echo "Bitte erstelle sofort einen Benutzer für Portainer unter https://localhost:9443"
