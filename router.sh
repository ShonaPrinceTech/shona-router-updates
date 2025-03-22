#!/bin/sh

# Log file (stored in RAM, resets on reboot)
LOGFILE="/var/log/update.log"

# Start logging
echo "$(date) - Running router update script..." >> $LOGFILE