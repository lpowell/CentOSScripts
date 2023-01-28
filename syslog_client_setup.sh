#!/bin/bash

echo "Splunk IP is $1"
echo "Writing edits to /etc/rsyslog.conf"
echo "*.* @@$1:601" >> /etc/rsyslog.conf
echo "*.* @@$1:9997" >> /etc/rsyslog.conf
echo "Confirming edits"
tail -c 2 /etc/rsyslog.conf
echo "Restarting syslog service"
systemctl restart rsyslog || service rsyslog restart
echo "Syslog forwarding is set up... Probably..."