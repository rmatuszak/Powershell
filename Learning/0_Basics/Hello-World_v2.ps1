<#
  .SYNOPSIS
    	Say simple "Hello", asking for users input
  .DESCRIPTION
    	Powershell script for showing simple example of "Hello" with
      requesting user input
  .EXAMPLE
    	PS> ./Hello-World_v2.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# 1. User Read-Host to get input data and save it to variable
$name = Read-Host "Please provide your name and press Enter"
Write-Host "Hello $name!"

# 2. Make it simplier
Write-Host "Hello $(Read-Host "Please, please - show me your name")"