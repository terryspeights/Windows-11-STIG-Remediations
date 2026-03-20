<#
.SYNOPSIS
    Remediation for STIG ID: WN11-AC-000010
    Description: This PowerShell script ensures that the Lockout Threshold is set to 3 attempts.
.NOTES

    Author          : Terry Speights
    LinkedIn        : linkedin.com/in/terryspeights/
    GitHub          : github.com/terryspeights
    Date Created    : 2026-04-19
    Last Modified   : 2026-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010


net accounts /lockoutthreshold:3
Write-Host "Verification: $(net accounts | Select-String 'Lockout threshold')" -ForegroundColor Green
