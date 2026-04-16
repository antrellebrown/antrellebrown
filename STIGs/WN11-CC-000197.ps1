<#
.SYNOPSIS
    This PowerShell script modifies the registry to disable Microsoft consumer experiences (like automatic app downloads and suggestions).

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 4/16/2026
    Last Modified   : 4/16/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000197/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000197.ps1
#>


# Define the registry path for Cloud Content / Consumer Experiences
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows\CloudContent"
$name = "DisableWindowsConsumerFeatures"
$value = 1 # 1 means "Disabled/Turned Off"

# Create the key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value to enforce the STIG requirement
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord

Write-Host "STIG Check WN11-CC-000197: Microsoft consumer experiences have been turned off."
