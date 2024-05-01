if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi


# Dateien erstellen
echo "apt update && apt upgrade -y" > update.sh
echo "Update Skript erstellt."


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

if apt install -y vim nano git wget curl unzip cron  >/dev/null; then
    echo "Installation der Programme erfolgreich."
else
    echo "Fehler bei der Installation der Programme."
fi


# Automatisches Update
# Überprüfe, ob der Cronjob bereits existiert
if ! crontab -l | grep -q "sh ./update.sh"; then
    # Füge den Cronjob hinzu
    (crontab -l ; echo "0 4 * * * sh ./update.sh >/dev/null 2>&1") | crontab -
    echo "Cronjob wurde hinzugefügt."
else
    echo "Cronjob existiert bereits."
fi


# Falsche Docker deinstallieren
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Richtiges Docker laden und installieren
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Portainer installieren
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
echo "ACHTUNG: Bitte erstelle unbedingt dein Login bei Portainer!"
echo "Du kannst es hier erreichen: https://localhost:9443"
