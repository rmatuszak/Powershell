<#
  .SYNOPSIS
    	Pipeline example
  .DESCRIPTION
    	Example of a pipeline in Powershell
  .EXAMPLE
    	PS> ./Get-PipelineExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Get a list of files in the C:\Windows\System32 directory, filter for .dll files, and display their names and sizes
Get-ChildItem -Path C:\Windows\System32 -File | `
Where-Object { $_.Extension -eq '.exe' } | `
Select-Object Name, Length

# Please note, that I used the " ` " symbol to break the line.
# Also, what's worth to mention is the $_ symbol - it's pointing
# to the current object in iteration of pipeline.