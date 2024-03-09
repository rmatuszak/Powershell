<#
  .SYNOPSIS
    	Loops examples
  .DESCRIPTION
    	Examples of loops available in Powershell
  .EXAMPLE
    	PS> ./Get-LoopExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Example of a "for" loop - printing number from 1 to 10

Write-Host "---FOR LOOP---"
for ($j = 1; $j -le 10; $j++) {
    Write-Host "Iteration $j"
}

Write-Host "---FOREACH LOOP---"
# Example of a "foreach" loop - iterating over a list of objects e.g. array
$servers = @("server1", "server2", "server3") # array definition @()
foreach ($server in $servers) {
    Write-Host "Name of server: $server"
}

# Example of a "while" loop - printing counter while
# it's larger or equal to 3

Write-Host "---WHILE LOOP---"
$counter = 1

while ($counter -le 3) {
    Write-Host "Iteration $counter"
    $counter++
}



# Example of a "do...while" loop - printing counter while
# it's larger or equal to 3

Write-Host "---DO...WHILE LOOP---"
$counter = 1
do {
    Write-Host "Iteration $counter"
    $counter++
} while ($counter -le 3)


# Example of a "do...until" loop - printing counter until the
# it's equal to 4

Write-Host "---DO...UNTIL LOOP---"
$counter = 1

do {
    Write-Host "Iteration $counter"
    $counter++
} until ($counter -eq 4)
