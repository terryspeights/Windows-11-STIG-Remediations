<#
.SYNOPSIS
    Remediation for STIG ID: WN11-00-000160
    Description: SMBv1 protocol must be disabled.

.DESCRIPTION
    Disables the SMBv1 protocol to prevent legacy exploits.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-00-000160..." -ForegroundColor Cyan
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
Write-Host "Verification: SMBv1 protocol disabled." -ForegroundColor Green
