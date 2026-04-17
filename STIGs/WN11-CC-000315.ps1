<#
.SYNOPSIS
    This PowerShell script ensures the policy is explicity disabled in both the Local Machine and Current User registry hives 

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000315.ps1
#>


# Define registry paths for Machine and User hives
$machinePath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"
$userPath    = "HKCU:\Software\Policies\Microsoft\Windows\Installer"
$name = "AlwaysInstallElevated"
$value = 0 # 0 means Disabled

# Apply to Local Machine
if (!(Test-Path $machinePath)) { New-Item -Path $machinePath -Force }
Set-ItemProperty -Path $machinePath -Name $name -Value $value -Type DWord

# Apply to Current User
if (!(Test-Path $userPath)) { New-Item -Path $userPath -Force }
Set-ItemProperty -Path $userPath -Name $name -Value $value -Type DWord

Write-Host "STIG Check WN11-CC-000315: AlwaysInstallElevated has been disabled for both Machine and User." -ForegroundColor Green
