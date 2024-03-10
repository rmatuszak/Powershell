<#
  .SYNOPSIS
    	Get remote credentials
  .DESCRIPTION
    	Collects credentials for working with a remote machine, without
        prompting a GUI window
  .EXAMPLE
    	PS> ./Get-RemoteServerDiskSpace.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# an example fo creating a function in Powershell - returning
# an object of PSCredential type
function collectCredentials{
    return New-Object System.Management.Automation.PSCredential(`
        $(Read-Host "Username"),`
        $(Read-Host "Password" -AsSecureString))
}

# calling the function

collectCredentials
