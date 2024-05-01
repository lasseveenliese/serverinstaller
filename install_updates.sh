# Bash prüfen
if [ -n "$BASH_VERSION" ]; then
    echo "Das Skript wird mit Bash ausgeführt."
else
    echo "Das Skript wird nicht mit Bash ausgeführt. Bitte führen Sie es mit Bash aus."
    exit 1
fi


# Update Skript erstellen
if [ echo "apt update && apt upgrade -y" > /update.sh ]; then
    echo "Update Skript erstellt."
else
    echo "Das Update Skript konnte nicht erstellt werden."
    exit 1
fi

# Automatisches Update
if ! crontab -l | grep -q "sh /update.sh"; then
    (crontab -l ; echo "0 4 * * * sh /update.sh >/dev/null 2>&1") | crontab -
    echo "Cronjob wurde hinzugefügt."
else
    echo "Cronjob existiert bereits."
fi
