<#
  .SYNOPSIS
    	Conditional examples
  .DESCRIPTION
    	Couple of conditional examples in Powershell
  .EXAMPLE
    	PS> ./Get-ConditionalExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Before screening the code - please note, that condtitionals in Powershell
# refer more to comparision convention from Unix/BASH, than to programming
# languages. For example, to check if some value is greater than other, we
# would use "-gt" operand for that. This is just a shortcut for "greater than".
# In very similar way we use other comparators: -eq, -lt, -le etc.

# First, the simple case

$mambo = 5
if($mambo -eq 5){
    Write-Host "This is Mambo no. 5!"
}

# But we want to know, what Mambo is it, if not no 5?

$mambo = 6
if($mambo -eq 5){
    Write-Host "This is Mambo no. 5!"
} else {
    Write-Host "Meh, it's not Mambo no. 5, it's Mambo no. $mambo"
}

# Ok, Mambo no. 5 and mambo. no 6 are cool, but what if it's still something else
$mambo = 56
if($mambo -eq 5){
    Write-Host "This is Mambo no. 5!"
} elseif($mambo -eq 6) {
    Write-Host "This is Mambo no. 6"
} else {
    Write-Host "No, no, no, different mambo, it's no. $mambo"
}


# For the end - an example of switch statement
$mambo = Read-Host "Gimme Mambo, baby!"

switch ($mambo) {
    "1" {
        Write-Host "Nah, that's not cool Mambo."
    }
    "2" {
        Write-Host "It's at least 3 Mambo-numbers behind"
    }
    "3" {
        Write-Host "You're quite close to the proper Mambo"
    }
    "4" {
        Write-Host "Not yet, but you are soooo close!"
    }
    "5" {
        Write-Host "THIS IS MAMBO NO. 5!!"
    }
    "6" {
        Write-Host "Relax, to fast, you missed the correct Mambo!"
    }
    "7" {
        Write-Host "You're too far! Turn to right Mambo"
    }
    default {
        Write-Host "Dunno what Mambo did you propose?!"
    }
}
