param($password,$ip)
# invoke-webrequest -URI "https://download.splunk.com/products/universalforwarder/releases/9.0.3/windows/splunkforwarder-9.0.3-dd0128b1f8cd-x64-release.msi" -outfile splunkuniversalforwarder_x86.msi
write-host "Splunk IP: $ip"
Start-Process msiexec.exe -Wait -ArgumentList '/i splunkuniversalforwarder_x86.msi RECEIVING_INDEX="$ip:9998" AGREETOLICENSE=Yes SPLUNKUSERNAME=SplunkAdmin SPLUNKPASSWORD=$password WINEVENTLOG_SEC_ENABLE=1 WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_FWD_ENABLE=1 WINEVENTLOG_SET_ENABLE=1 /quiet'