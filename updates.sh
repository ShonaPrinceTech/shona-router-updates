#!/bin/sh

# Log file (stored in RAM, resets on reboot)
LOGFILE="/var/log/update.log"

# Start logging
echo "$(date) - Checking for updates..." >> $LOGFILE

# Update package list
echo "Updating package list..."
opkg update >> $LOGFILE 2>&1

# Restart services if needed
echo "Restarting network services..." >> $LOGFILE
/etc/init.d/network restart >> $LOGFILE 2>&1

# Log completion
echo "$(date) - Update completed successfully." >> $LOGFILE
