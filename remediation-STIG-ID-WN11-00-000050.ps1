<#
.SYNOPSIS
    Remediation/Check for STIG ID: WN11-00-000050
    Description: Local volumes must be formatted using NTFS.

.DESCRIPTION
    Audits local fixed drives to ensure they use the NTFS filesystem.

.NOTES
    Author: Terry Speights
    Date: 19 March 2026
#>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as an Administrator."
    Exit
}

Write-Host "Checking WN11-00-000050..." -ForegroundColor Cyan
$Drives = Get-Volume | Where-Object { $_.FileSystem -ne "NTFS" -and $_.DriveType -eq "Fixed" }
if ($null -eq $Drives) {
    Write-Host "Verification: All fixed local volumes are NTFS." -ForegroundColor Green
} else {
    Write-Warning "Non-NTFS drives found: $($Drives.DriveLetter)"
}
