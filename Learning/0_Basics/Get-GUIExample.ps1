<#
  .SYNOPSIS
    	Example of a GUI/.NET
  .DESCRIPTION
    	An example of using GUI with .NET classes in Powershell
  .EXAMPLE
    	PS> ./Get-GUIExample.ps1
  .LINK
	    https://github.com/rmatuszak/Powershell
  .NOTES
	    Author: Rafal Matuszak
#>

# Loading .NET assembly
Add-Type -AssemblyName System.Windows.Forms

# Creating the form
$form = New-Object Windows.Forms.Form
$form.Text = "Input Form in PWSH"
$form.Size = New-Object Drawing.Size(400,200)

# Creating labels
$labelName = New-Object Windows.Forms.Label
$labelName.Text = "Please provide your name:"
$labelName.Location = New-Object Drawing.Point(20, 20)

# Creating textboxes
$textboxName = New-Object Windows.Forms.TextBox
$textboxName.Location = New-Object Drawing.Point(150, 20)

# Creating a button
$buttonSubmit = New-Object Windows.Forms.Button
$buttonSubmit.Location = New-Object Drawing.Point(150, 60)
$buttonSubmit.Text = "Greet"

# Defining the button click event
$buttonSubmit.Add_Click({
    $enteredName = $textboxName.Text
    [System.Windows.Forms.MessageBox]::Show("Hi, $enteredName! Welcome to PowerShell GUI.", "Greeting")
})

# Adding controls to the form
$form.Controls.Add($labelName)
$form.Controls.Add($textboxName)
$form.Controls.Add($buttonSubmit)

# Displaying the final form
$form.ShowDialog()
