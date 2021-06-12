# Custom Script Extensions

- Custom Script Extensions is used for ensuring IIS is installed via script on first server boot up

## Steps to Setup
1. Create a new VM and Allow Port 80
1. Refer file [IIS.ps1](IIS.ps1)
1. Create a storage account and create a container in it
1. Upload [IIS.ps1](IIS.ps1) file in Storage Account\Container
1. Open existing VM in Azure Portal
1. From left menu -> Open Extensions -> Click Add -> Custom Script Extension
1. Attach file from storage account
1. After 10 min inspect custom script Extension status and open the URL in browser
