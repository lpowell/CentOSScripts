param($password,$ip)
invoke-webrequset -URI "https://download.splunk.com/products/universalforwarder/releases/9.0.3/windows/splunkforwarder-9.0.3-dd0128b1f8cd-x64-release.msi" -outfile splunkuniversalforwarder_x86.msi
msiexec.exe /i splunkuniversalforwarder_x86.msi DEPLOYMENT_SERVER="$ip:8089" AGREETOLICENSE=Yes SPLUNKUSERNAME=SplunkAdmin SPLUNKPASSWORD=$password