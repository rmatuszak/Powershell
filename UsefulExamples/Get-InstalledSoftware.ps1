<#
  .SYNOPSIS
    	Get installed software
  .DESCRIPTION
    	Get installed software in Windows system
  .EXAMPLE
    	PS> ./Get-InstalledSoftware.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

$software = Get-CimInstance Win32_Product
Write-Host "==========================================="
Write-Host "INSTALLED SOFTWARE ON $env:computername"
Write-Host "==========================================="

$software

$saveToFile = Read-Host "Save results to file (Y\N)?"
if($saveToFile.tolower() -eq "y"){
    $fileToSave = "C:\Logs\"+$env:computername+"_installed_software.txt"
    if (-not (Test-Path -Path "C:\logs\")){
        New-Item -ItemType Directory -Name Logs -Path "C:\" | Out-Null
    }
    if (Test-Path -Path $fileToSave){
        $overwrite = Read-Host "Log file already exist. Overwrite? (Y\N)"
        if ($overwrite.tolower() -eq "y"){
            $software | Out-File -Path $fileToSave
            Write-Host "Log saved"
        }
        else {
            Write-Host "Installed software not saved"
        }
    } else {
        $software | Out-File -Path $fileToSave
        Write-Host "Installed software saved"
    }


} else {
    Write-Host "Installed software not saved"
}
