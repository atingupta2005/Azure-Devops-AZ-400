Add-WindowsFeature Web-Server
Set-Content -Path "C:\inetpub\wwwroot\app.html" -Value "Computer Name $($env:computername) !"