<#
  .SYNOPSIS
    	Get disk space on remotes
  .DESCRIPTION
    	Gets the disk space on remote machines,defined in external file
  .EXAMPLE
    	PS> ./Get-RemoteServerDiskSpace.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Provide a list of servers in a text file
# TIP: may be automated by adding a param clause,
# thanks to which you can provide this list as a
# script parameter from command line!

$servers = Get-Content -Path "servers.txt"

foreach ($server in $servers) {
    Write-Host "Checking disk space on $server"

    try {
        # Attempt to establish a remote PowerShell session
        # TIP: remember! In this step you may require to add some credentials
        # see examples in: Get-RemoteCredentials.ps1 example script
        $session = New-PSSession -ComputerName $server -ErrorAction Stop

        # Run a command to get disk space information
        $diskSpace = Invoke-Command -Session $session -ScriptBlock {
            Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, VolumeName, @{Name='FreeSpaceGB';Expression={"{0:N2}" -f ($_.FreeSpace / 1GB)}}
        } -ErrorAction Stop

        # Display the disk space information
        $diskSpace | Format-Table -AutoSize

    } catch {
        Write-Host "Failed to check disk space on $server. Error: $_"
    } finally {
        # Close the remote session
        Remove-PSSession -Session $session -ErrorAction SilentlyContinue
    }
}