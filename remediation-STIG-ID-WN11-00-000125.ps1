<#
.SYNOPSIS
    Remediation for STIG ID: WN11-00-000125
    Description: Copilot must be disabled.

.DESCRIPTION
    Disables Windows Copilot via a Registry Policy key.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Remediating WN11-00-000125..." -ForegroundColor Cyan
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
if (!(Test-Path $Path)) { New-Item -Path $Path -Force }
Set-ItemProperty -Path $Path -Name "TurnOffWindowsCopilot" -Value 1
Write-Host "Verification: TurnOffWindowsCopilot set to 1." -ForegroundColor Green
