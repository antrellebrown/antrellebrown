<#
.SYNOPSIS
    This PowerShell script ensures that Group Policy Objects (GPOs) are reprocessed even if they haven't changed.

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 4/16/2026
    Last Modified   : 4/16/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000090
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000090/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000090.ps1 
#>


# Define the registry path for Group Policy processing
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$name = "NoGPOListChanges"
$value = 0 # 0 means "Process even if no changes"

# Ensure the registry key exists
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the value to 0 to force processing
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord

Write-Host "STIG Check WN11-CC-000090: Registry policy processing has been set to re-apply regardless of changes." 
