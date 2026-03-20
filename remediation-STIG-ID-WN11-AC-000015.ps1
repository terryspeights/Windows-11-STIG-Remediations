<#
.SYNOPSIS
    Remediation for STIG ID: WN11-AC-000015
    Description: Reset account lockout counter must be 15 minutes or greater.

.DESCRIPTION
    This script sets the reset window to 15 minutes.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-AC-000015..." -ForegroundColor Cyan
net accounts /lockoutwindow:15
$results = net accounts | Select-String "Lockout observation window"
Write-Host "Verification: $results" -ForegroundColor Green
