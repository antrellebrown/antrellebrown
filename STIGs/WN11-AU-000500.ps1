.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/15/2026
    Last Modified   : 04/16/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000500.ps1 
#>

# Define the Registry Path and Property
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 32768 # Value in KB

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "Created Registry Path: $registryPath" -ForegroundColor Cyan
}

# Set the MaxSize value to 32768 KB (32MB)
try {
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force -ErrorAction Stop
    Write-Host "Successfully set Application Log MaxSize to 32768 KB via Registry." -ForegroundColor Green
}
catch {
    Write-Error "Failed to update registry. Please ensure you are running as an Administrator."
}

# Force an update to the Event Log service to recognize the change
wevtutil sl Application /ms:33554432 # 32MB converted to Bytes for the command line utility
