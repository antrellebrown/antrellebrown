<#
.SYNOPSIS
    This PowerShell script immediately stops the Secondary Logon service and sets its startup type to Disabled to ensure it does not start on reboot

.NOTES
    Author          : AnTrelle Brown
    LinkedIn        : linkedin.com/in/antrelle-brown/
    GitHub          : github.com/antrellebrown
    Date Created    : 04/17/2026
    Last Modified   : 04/17/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000175
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000175/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000175.ps1
#>



# Define the service name
$serviceName = "seclogon"

# Check if the service exists
if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    # Stop the service and set startup type to Disabled
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    Set-Service -Name $serviceName -StartupType Disabled
    
    Write-Host "STIG Check WN11-00-000175: Secondary Logon service has been disabled." -ForegroundColor Green
} else {
    Write-Warning "Secondary Logon service (seclogon) was not found on this system."
}
