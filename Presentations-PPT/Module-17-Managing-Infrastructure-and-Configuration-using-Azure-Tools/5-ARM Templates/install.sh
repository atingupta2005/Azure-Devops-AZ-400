$temp_path = "D:\"
$installer_url = "https://download.visualstudio.microsoft.com/download/pr/fa3f472e-f47f-4ef5-8242-d3438dd59b42/9b2d9d4eecb33fe98060fd2a2cb01dcd/dotnet-hosting-3.1.0-win.exe"
$installer_file = $temp_path + [System.IO.Path]::GetFileName( $installer_url )
 
Try
{
   add-windowsfeature web-server -includeallsubfeature
   Invoke-WebRequest -Uri $installer_url -OutFile $installer_file
 
$args = New-Object -TypeName System.Collections.Generic.List[System.String]
$args.Add("/quiet")
$args.Add("/norestart")
Start-Process -FilePath $installer_file -ArgumentList $args -NoNewWindow -Wait -PassThru
 
}
Catch
{
   Write-Output ( $_.Exception.ToString() )
   Break
}