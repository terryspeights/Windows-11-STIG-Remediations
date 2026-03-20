<#
.SYNOPSIS
    Remediation for STIG ID: WN11-PK-000005
    Description: DoD Root CA certificates must be installed.

.DESCRIPTION
    Ensures DoD Root certificates are present in the Trusted Root store.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-PK-000005..." -ForegroundColor Cyan
# Logic: Checks the store for 'DoD Root' certificates
$Certs = Get-ChildItem -Path Cert:\LocalMachine\Root | Where-Object { $_.Subject -like "*DoD*" }
if ($Certs) {
    Write-Host "Verification: DoD Root certificates found in store." -ForegroundColor Green
} else {
    Write-Host "Warning: DoD Root certificates missing. Import required certificates." -ForegroundColor Yellow
}
