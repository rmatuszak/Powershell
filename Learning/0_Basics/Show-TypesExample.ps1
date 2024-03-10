<#
  .SYNOPSIS
    	Example of types in Powershell
  .DESCRIPTION
    	Script exploring several data types in Powershell
  .EXAMPLE
    	PS> ./Show-TypesExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Below we can find several variables, with assigned different data type
# used in Powershell

$string = "Hello, World!"
$integer = 3424
$double = 211.98
$boolean = $true
$array = 2, 1, 3, 6, 7
$hashtable = @{ "ServerName" = "cidserver-01.corp.intel.com"; "IP_Address" = "10.74.190.82" }
$datetime = Get-Date
$nullVariable = $null

# Let's print out those variable and what type they represent
Write-Host "Variable string is type: $($string.gettype().Name)"
Write-Host "Variable integer is type: $($integer.gettype().Name)"
Write-Host "Variable double is type: $($double.gettype().Name)"
Write-Host "Variable boolean is type: $($boolean.gettype().Name)"
Write-Host "Variable array is type: $($array.gettype().Name)"
Write-Host "Variable hashtable is type: $($hashtable.gettype().Name)"
Write-Host "Variable datetime is type: $($datetime.gettype().Name)"
Write-Host "Variable nullVariable is type: $($nullVariable.gettype().Name)"

# Please note, that error while executing this script on the end
# is asbolutely expected - we can't call gettype() method on a null object :)

# Also, while listing Array type, we don't get just "Array", but Object[]
# that is because Array is not a simple data type, it's based on another one