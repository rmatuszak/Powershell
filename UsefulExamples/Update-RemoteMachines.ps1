<#
  .SYNOPSIS
    	Update remote machines
  .DESCRIPTION
    	Run Windows Updates on a group of remote machines
  .EXAMPLE
    	PS> ./Update-RemoteMachines.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Provide a list of servers in a text file
# TIP: may be automated by adding a param clause,
# thanks to which you can provide this list as a
# script parameter from command line!

# List of server names
$servers = Get-Content -Path "servers.txt"

foreach ($server in $servers) {
    Write-Host "Checking for updates on $server"

    try {
        # Attempt to establish a remote PowerShell session
        # TIP: remember! In this step you may require to add some credentials
        # see examples in: Get-RemoteCredentials.ps1 example script
        $session = New-PSSession -ComputerName $server -ErrorAction Stop

        # Run a command to check for pending updates
        $updates = Invoke-Command -Session $session -ScriptBlock {
            $updateSession = New-Object -ComObject Microsoft.Update.Session
            $updateSearcher = $updateSession.CreateUpdateSearcher()
            $updateSearchResult = $updateSearcher.Search("IsInstalled=0")
            $updateSearchResult.Updates
        } -ErrorAction Stop

        # If updates are found, install them
        if ($updates.Count -gt 0) {
            Write-Host "Found $($updates.Count) pending updates. Installing..."
            Invoke-Command -Session $session -ScriptBlock {
                $updateInstaller = New-Object -ComObject Microsoft.Update.UpdateInstaller
                $updateInstaller.Updates = $using:updates
                $installationResult = $updateInstaller.Install()
                $installationResult.HResult
            } -ErrorAction Stop
            Write-Host "Updates installed successfully."
        } else {
            Write-Host "No pending updates found."
        }

    } catch {
        Write-Host "Failed to check/install updates on $server. Error: $_"
    } finally {
        # Close the remote session
        Remove-PSSession -Session $session -ErrorAction SilentlyContinue
    }

    Write-Host ""
}
