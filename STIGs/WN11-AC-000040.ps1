<#
.SYNOPSIS
    This PowerShell script enables the Password Complexity filter, forcing creation of complex passwords

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000040
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000040/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000040.ps1
#>


# Export the current security configuration to a temporary file
$secConfigFile = "$env:TEMP\secconfig.inf"
secedit /export /cfg $secConfigFile /areas SECURITYPOLICY

# Read the file and update the Complexity setting
$content = Get-Content $secConfigFile
$newContent = $content -replace "PasswordComplexity = 0", "PasswordComplexity = 1"

# If the setting wasn't found (it might be missing), add it under [System Access]
if (!($content -match "PasswordComplexity")) {
    $newContent = $content -replace "\[System Access\]", "[System Access]`nPasswordComplexity = 1"
}

$newContent | Set-Content $secConfigFile

# Re-import the modified configuration
secedit /configure /db $env:windir\security\local.sdb /cfg $secConfigFile /areas SECURITYPOLICY

# Cleanup
Remove-Item $secConfigFile
Write-Host "STIG WN11-AC-000040: Password complexity requirements have been enabled." -ForegroundColor Green
