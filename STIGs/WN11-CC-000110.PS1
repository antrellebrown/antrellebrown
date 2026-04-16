<#
.SYNOPSIS
    This PowerShell script modifies the registry to disable the HTTP printing client on the local machine
 .NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 4/16/2026
    Last Modified   : 4/16/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000110/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000110.ps1
#>



# Define the registry path for Printer settings
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows NT\Printers"
$name = "DisableHTTPPrinting"
$value = 1 # 1 means HTTP printing is disabled

# Ensure the registry key path exists
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value to 1 to disable HTTP printing
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord

Write-Host "STIG Check WN11-CC-000110: Printing over HTTP has been disabled." -ForegroundColor Green
