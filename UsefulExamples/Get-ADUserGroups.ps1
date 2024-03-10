<#
  .SYNOPSIS
    	Get AD user groups
  .DESCRIPTION
    	Gets AD user groups
  .EXAMPLE
    	PS> ./Get-ADUserGroups.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Specify the username (sAMAccountName) of the user

# TIP: this may be provided as a cmdlet argument!

# TIP2: before running this script, please ensure that you have
# installed and imported ActiveDirectory module, by typing command
# Install-Module -Name RSAT-AD-PowerShell -Force -Scope CurrentUser
# (import will be called automatically, while running cmdlet)
$userName = "rmatusza"

# Get AD user information
try {
    $user = Get-AdUser -Identity $userName -Properties MemberOf -ErrorAction Stop
    $userGroups = $user.MemberOf | Get-AdGroup | Select-Object Name, SamAccountName
    Write-Host "Groups for user $($user.SamAccountName):"
    $userGroups | Format-Table -AutoSize
} catch {
    Write-Host "Failed to retrieve user information. Error: $_"
}