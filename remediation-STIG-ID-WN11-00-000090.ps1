<#
.SYNOPSIS
    Remediation for STIG ID: WN11-00-000090
    Description: Accounts must be configured to require password expiration.

.DESCRIPTION
    Identifies and fixes local accounts set to 'Password Never Expires'.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-00-000090..." -ForegroundColor Cyan
Get-LocalUser | Where-Object { $_.PasswordNeverExpires -eq $true } | Set-LocalUser -PasswordNeverExpires $false
Write-Host "Verification: Local user accounts updated to require expiration." -ForegroundColor Green
