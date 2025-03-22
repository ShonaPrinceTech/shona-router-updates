#!/bin/sh

# Log file (stored in RAM, resets on reboot)
LOGFILE="/var/log/update.log"

# Start logging
echo "$(date) - Checking for updates..." >> $LOGFILE

# Update package list
echo "Updating package list..."
opkg update >> $LOGFILE 2>&1

# Download latest update script from GitHub
echo "Downloading latest update script..."
curl -s -o /root/router.sh https://raw.githubusercontent.com/ShonaPrinceTech/shona-router-updates/main/updates.sh >> $LOGFILE 2>&1

# Ensure script was downloaded successfully
if [ -s /root/router.sh ]; then
    chmod +x /root/router.sh
    echo "Successfully downloaded and updated router script." >> $LOGFILE
else
    echo "Failed to download update script. Check GitHub link." >> $LOGFILE
    exit 1
fi

# Restart services if needed
echo "Restarting network services..." >> $LOGFILE
/etc/init.d/network restart >> $LOGFILE 2>&1

# Log completion
echo "$(date) - Update completed successfully." >> $LOGFILE
