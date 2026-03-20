WN11-AC-000005: Account Lockout Duration
<#
.SYNOPSIS
    Remediation for STIG ID: WN11-AC-000005
    Description: Account lockout duration must be 15 minutes or greater.
.NOTES
    Author: Terry Speights
    LinkedIn        : linkedin.com/in/terryspeights/
    GitHub          : github.com/terryspeights
    Date Created    : 2026-04-19
    Last Modified   : 2026-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000500
#>
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { 
    Write-Warning "Run as Admin."; Exit 
}
Write-Host "Remediating WN11-AC-000005..." -ForegroundColor Cyan
net accounts /lockoutduration:15
Write-Host "Verification: $(net accounts | Select-String 'Lockout duration')" -ForegroundColor Green
