<#
  .SYNOPSIS
    	Modules example
  .DESCRIPTION
    	Shows how to instal and use modules
  .EXAMPLE
    	PS> ./Get-ExceptionExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

Install-Module -Name PSReadline -Force -Scope CurrentUser
Import-Module -Name PSReadline

# Syntax highlighting for better readability
Set-PSReadlineOption -Colors @{
    Command            = 'DarkYellow'
    Parameter          = 'DarkGray'
    String             = 'DarkCyan'
    Number             = 'DarkGreen'
    Operator           = 'Gray'
    Variable           = 'Cyan'
    CommandParameter   = 'DarkYellow'
    CommandArgument    = 'Gray'
    Comment            = 'DarkGreen'
    Keyword            = 'Cyan'
    Type               = 'Cyan'
    Member             = 'DarkCyan'
    StringExpandable   = 'DarkCyan'
    StringVariable     = 'DarkCyan'
}

# PSReadline module is now imported and configured
Write-Host "PSReadline module imported and configured."