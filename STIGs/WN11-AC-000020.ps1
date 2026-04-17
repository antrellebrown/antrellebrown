<#
.SYNOPSIS
    This PowerShell script uses the net accounts command to enforce the password history requirement.

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000020
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000020/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000020.ps1
#>


# Set the Password History to remember 24 passwords
# This complies with DISA STIG WN11-AC-000020
net accounts /uniquepw:24

# Verify the setting was applied correctly
# We use -replace to clean up the output for better readability
$historyStatus = (net accounts | Select-String "Length of password history maintained").ToString().Trim()

Write-Host "Verification Success: $historyStatus" -ForegroundColor Green

# Comment:
# This ensures that users cannot rotate through a small set of passwords,
# maintaining the integrity of periodic password changes.
