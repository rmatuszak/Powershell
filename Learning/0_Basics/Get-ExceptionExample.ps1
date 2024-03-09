<#
  .SYNOPSIS
    	Example of a try...catch clause
  .DESCRIPTION
    	Displays, how does try...catch clause work in Powershell
  .EXAMPLE
    	PS> ./Get-ExceptionExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

try {
    # Example of generating an exception - not existing file
    $filePath = "C:\Nosuchfile.txt"
    $content = Get-Content $filePath -ErrorAction Stop
    Write-Host "File content: $content"
}
catch [System.IO.FileNotFoundException] {
    # Occurs only for FileNotFoundException
    Write-Host "File not found: $($_.Exception.Message)"
}
catch {
    # Generic catch block for other exceptions cases
    Write-Host "An error occurred: $($_.Exception.Message)"
}
finally {
    # Executes always
    Write-Host "Finally block executed - no matter if you get exception, or not"
}