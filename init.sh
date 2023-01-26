#!/bin/bash
printf "Checking Configuration...\n"
ip a > /dev/null 2>&1
printf "\nPulling out adapter...\n"
IFS=":";ad=$(ip a | awk '$1 == "2:" {print $2}');read -ra irr <<< $ad; echo "${irr[0]}"
printf "\nAdapter: ${irr[0]}\n"
printf "\nOpening network configuration...\n"
cat /etc/sysconfig/network-scripts/ifcfg-${irr[0]} 2>&1 | tee netconf.txt
printf "\nChecking repositories...\n"
ls /etc/yum.repos.d/
printf "\nInstalling software...\n"
yum install -y epel-release clamav ntp openssl > /dev/null 2>&1
printf "\nPulling scripts...\n"
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ServiceMapper.sh" >> ServiceMapper.sh > /dev/null 2>&1
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ProcessMapper.sh" >> ProcessMapper.sh > /dev/null 2>&1
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/splunk_firewall.sh" >> Firewall.sh > /dev/null 2>&1
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ProcessMapper.sh" >> Enum.sh > /dev/null 2>&1
printf "\nRunning scripts...\n"
chmod 755 ServiceMapper.sh ProcessMapper.sh Firewall.sh Enum.sh > /dev/null 2>&1
bash Enum.sh 2>&1 | tee enumout.txt > /dev/null 2>&1
bash Firewall.sh 2>&1 | tee firewallout.txt > /dev/null 2>&1
bash ServiceMapper.sh 2>&1 | tee services.txt > /dev/null 2>&1
bash ProcessMapper.sh 2>&1 | tee processes.txt > /dev/null 2>&1
tar -cf gravbackup.tar /opt/gravwell/www
tar -cf splunkbackup.tar /opt/splunk 
printf "\nScript Copmlete\n"
printf "\nInstalling GUI files...\n"
yum -y groups install "GNOME Desktop" >/tmp/yum-out 2>&1 &
echo "exec gnome-session" >> ~/.xinitrc
printf "Done installing, run startx to start\n"
