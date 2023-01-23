#!/bin/bash
printf "Checking Configuration...\n"
ip a
printf "Pulling out adapter...\n"
IFS=":";ad=$(ip a | awk '$1 == "2:" {print $2}');read -ra irr <<< $ad; echo "${irr[0]}"
printf "Adapter: ${irr[0]}"
printf "Opening network configuration...\n"
cat /etc/sysconfig/network-scripts/ifcfg-${irr[0]}
printf "Checking repositories...\n"
ls /etc/yum.repos.d/
printf "Installing software...\n"
yum install -y epel-release clamav ntp openssl
# printf "Pulling password...\n"
# curl "password file here" >> passwd.enc
# printf "Decrypting password...\n"
# openssl aes-256-cbc -d -in passwd.enc | base64 -d | passwd root --stdin
# printf "Password Changed\n"
printf "Changing root password\n"
passwd root 
printf "\nPulling scripts...\n"
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ServiceMapper.sh" >> enum.sh
curl "https://raw.githubusercontent.com/lpowell/CentOSScripts/main/ProcessMapper.sh" >> firewall.sh
printf "Running scripts...\n"
bash enum.sh 2>&1 | tee enumout.txt
bash firewall 2>&1 | tee firewallout.txt
tar -cf gravbackup.tar /opt/gravwell/www
tar -cf splunkbackup.tar /opt/splunk 
printf "Script Copmlete\n"