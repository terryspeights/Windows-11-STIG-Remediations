<#
.SYNOPSIS
    Remediation for STIG ID: WN11-00-000175
    Description: Secondary Logon service must be disabled.

.DESCRIPTION
    Disables the 'seclogon' service to minimize the attack surface.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-00-000175..." -ForegroundColor Cyan
Stop-Service -Name "seclogon" -ErrorAction SilentlyContinue
Set-Service -Name "seclogon" -StartupType Disabled
Write-Host "Verification: Secondary Logon service status: $(Get-Service seclogon | Select-Object -ExpandProperty Status)" -ForegroundColor Green
