<#
.SYNOPSIS
    Remediation for STIG ID: WN11-00-000155
    Description: Windows PowerShell 2.0 must be disabled.

.DESCRIPTION
    Disables the deprecated and insecure PowerShell 2.0 feature.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-00-000155..." -ForegroundColor Cyan
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart
Write-Host "Verification: Feature 'MicrosoftWindowsPowerShellV2Root' disabled." -ForegroundColor Green
