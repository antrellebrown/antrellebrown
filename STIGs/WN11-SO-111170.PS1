<#
.SYNOPSIS
    This PowerShell script sets the machine inactivity limit to 900 seconds (15 minutes) via the registry. 

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000070
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-SO-000070/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000070.ps1
#>


# Define the registry path for Security Options
$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$name = "InactivityTimeoutSecs"
$value = 900 # 900 seconds = 15 minutes

# Ensure the registry key exists
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the timeout value
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord

Write-Host "STIG Check WN11-SO-000070: Machine inactivity limit set to 900 seconds." 
