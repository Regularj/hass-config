#!/bin/bash
# Simple script that uses systemctl to check if a service is
# running. If its not it is restarted and an email is sent to
# the configured mailbox.
#
# http://wp.me/p25Sys-c0 
# m00nie
######################

# The service we want to check (according to systemctl)
SERVICE=homebridge.service
# Where to send the restart mail to
MAILBOX=regularj@pictor.uberspace.de

if [ "`systemctl is-active $SERVICE`" != "active" ] 
then 
	echo "$SERVICE wasnt running so attempting restart"
	systemctl restart $SERVICE
	echo "Mailing $MAILBOX with current status"
	systemctl status $SERVICE | mail -s "$SERVICE was restarted" $MAILBOX
	exit 0
fi 
echo "$SERVICE is currently running"
exit 0
