# Publishing to Azure VM

1. Create a VM - Windows Server 2019 and Allow Port 80
1. Connect to VM
1. Open Server Manager
1. Click Add Roles and Features
1. Select Server Roles - Web Server (IIS)
1. Make sure to enable Management service in "Role Service"
1. Open Tools->Internet Information Services
1. Enable Remote Connections
1. Apply and Start
1. Open Port -> 8172, 80, 8080
1. Disable IE Advanced Security from Management Server -> Local Server -> IE Enhanced Security Configuration
1. Download and install .Net Core 3.1\Hosting Bundle for Windows
  - https://download.visualstudio.microsoft.com/download/pr/ff658e5a-c017-4a63-9ffe-e53865963848/15875eef1f0b8e25974846e4a4518135/dotnet-hosting-3.1.3-win.exe

1. Download and Install Web Deploy 3.6\Complete Installation
  - https://www.microsoft.com/en-us/download/confirmation.aspx?id=43717&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
1. Configure DNS of VM from Azure Portal
1. Publish ASP.Net Core Web app from Visual Studio -> Azure Virtual Machines
1. Click Create Profile\Edit\Enter password of VM->Validate\Save
1. Publish
1. Inspect the URL
