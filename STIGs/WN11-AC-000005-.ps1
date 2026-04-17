<#
.SYNOPSIS
    This PowerShell script sets the account lockout duration to 15 minutes using the net accounts command and verifies the change.

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000005
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000005/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000005-.ps1
#>


# Set the Account Lockout Duration to 15 minutes
# This meets the DISA requirement for WN11-AC-000005
net accounts /lockoutduration:15

# Verify the setting was applied
$lockoutStatus = net accounts | Select-String "Lockout duration"
Write-Host "Verification: $lockoutStatus" -ForegroundColor Green

# Comment: 
# Setting this to 15 ensures that if a brute-force attack is detected, 
# the account remains inaccessible for a sufficient window to deter the attacker.
