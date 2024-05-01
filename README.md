# serverinstaller
Default settings for my servers

## Borg Backup
1. Repo und Passphrase erstellen

sudo borg init --encryption=repokey /backups

-> Mit "N" angeben, dass die Passphrase nicht angezeigt werden soll bei der Verifizierung.


2. Backup erstellen

sudo borg create --stats --progress --compression lz4 --exclude /proc --exclude /backups --exclude /sys --exclude /dev --exclude /run --exclude /mnt --exclude /media --exclude /lost+found --exclude /tmp --exclude /var/tmp /backups::BACKUPNAME / 


Nicht im Backup enthalten sein sollten:
Systemverzeichnisse: Virtuelle Dateisysteme wie /proc, /sys, /dev, /run, /mnt, /media, und /lost+found, da sie dynamische Daten enthalten, die bei jedem Start neu generiert werden.
Temporäre Dateien und Verzeichnisse: /tmp, /var/tmp, und temporäre Dateien in Benutzerverzeichnissen.
Cache-Verzeichnisse: /var/cache, da sie Cache-Daten enthalten, die regeneriert werden können.
