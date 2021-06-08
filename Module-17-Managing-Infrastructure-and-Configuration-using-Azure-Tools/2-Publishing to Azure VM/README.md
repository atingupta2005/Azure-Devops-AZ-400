# Publishing to Azure VM

1. Create a VM - Windows Server 2019 and Allow Port 80
1. Connect to VM
1. Open Server Manager
1. Click Add Roles and Features
1. Select Server Roles - Web Server (IIS) and click Next\Next
1. Make sure to enable "Management service" in "Role Services tab" in last check box
1. Open Server Manager->Tools->Internet Information Services
1. From left chose the machine below "Start Page" link
1. From right open "Management Service"
1. Select check box -> "Enable Remote Connections" on top
1. Click "Apply" and "Start"
1. Make sure to Open VM->NSG and Open Port -> 8172, 80, 8080
  - Port 8172 is used to publish project from Visual Studio
1. Disable IE Advanced Security from Management Server -> Local Server -> IE Enhanced Security Configuration
1. Download and install .Net Core 3.1
  - https://download.visualstudio.microsoft.com/download/pr/c8eabe25-bb2b-4089-992e-48198ff72ad8/a55a5313bfb65ac9bd2e5069dd4de5bc/dotnet-hosting-3.1.15-win.exe

1. Download and Install Web Deploy 3.6\Complete Installation (WebDeploy_amd64_en-US.msi)
  - https://www.microsoft.com/en-us/download/confirmation.aspx?id=43717&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
    - Make sure to select Full Install
  - Troubleshooting:
    - Open services.msc and make sure Web Deployment Agent Service is there and running
    - Test the port
      - netstat -ano | findstr :8172
1. Configure DNS of VM from Azure Portal
1. From Visual Studio, Publish ASP.Net Core Web app from Visual Studio -> Azure Virtual Machines
1. Click Create Profile\Edit\Enter password of VM->Validate\Save
1. Publish
1. Validate the publish of project by Inspecting the URL
