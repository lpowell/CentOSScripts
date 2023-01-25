#!/bin/bash
printf "Checking Configuration...\n"
ip a
printf "\nPulling out adapter...\n"
IFS=":";ad=$(ip a | awk '$1 == "2:" {print $2}');read -ra irr <<< $ad; echo "${irr[0]}"
printf "\nAdapter: ${irr[0]}\n"
printf "\nOpening network configuration...\n"
cat /etc/sysconfig/network-scripts/ifcfg-${irr[0]} 2>&1 | tee netconf.txt
printf "\nChecking repositories...\n"
ls /etc/yum.repos.d/
printf "\nInstalling software...\n"
yum install -y epel-release clamav ntp openssl
printf "\nPulling scripts...\n"
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ServiceMapper.sh" >> enum.sh
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ProcessMapper.sh" >> firewall.sh
printf "\nRunning scripts...\n"
bash enum.sh 2>&1 | tee enumout.txt
bash firewall.sh 2>&1 | tee firewallout.txt
tar -cf gravbackup.tar /opt/gravwell/www
tar -cf splunkbackup.tar /opt/splunk 
printf "\nScript Copmlete\n"