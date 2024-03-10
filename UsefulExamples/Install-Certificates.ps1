<#
  .SYNOPSIS
    	Install Intel certificates
  .DESCRIPTION
    	Installs Intel certificates on given machine
  .EXAMPLE
    	PS> ./Install-Certificate.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# [System.Environment]::SetEnvironmentVariable("PROXY", "http://proxy-dmz.intel.com:912")
# [System.Environment]::SetEnvironmentVariable("SECURE_PROXY", "http://proxy-dmz.intel.com:912")
# [System.Environment]::SetEnvironmentVariable("NO_PROXY", "localhost,127.0.0.1,*.intel.com")
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
# [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

$CERT_TMP_PATH = "C:\certs"

New-Item -ItemType Directory -Path "$CERT_TMP_PATH" | Out-Null

$WebClient = New-Object System.Net.WebClient

$WebClient.DownloadFile("http://certificates.intel.com/repository/certificates/IntelSHA2RootChain-Base64.zip", "$CERT_TMP_PATH\certs.zip")
Write-Output "Download 1 completed!"
$WebClient.DownloadFile("http://certificates.intel.com/repository/certificates/PublicSHA2RootChain-Base64-crosssigned.zip", "$CERT_TMP_PATH\sectigo_certs.zip")
Write-Output "Download 2 completed!"

Write-Output "Unpack C:\certs\certs.zip ..."
Expand-Archive "$CERT_TMP_PATH\certs.zip" -DestinationPath "$CERT_TMP_PATH"
Write-Output "Unpack completed!"
Write-Output "Unpack C:\certs\sectigo_certs.zip..."
Expand-Archive "$CERT_TMP_PATH\sectigo_certs.zip" -DestinationPath "$CERT_TMP_PATH\"
Write-Output "Unpack completed!"

foreach ($file in Get-ChildItem "$CERT_TMP_PATH\*.crt")
{
    Import-Certificate -FilePath "$file" -CertStoreLocation Cert:\LocalMachine\Root
}

Write-Output "Delete $CERT_TMP_PATH"
Remove-Item -Recurse -Force "$CERT_TMP_PATH"