#!/usr/bin/env pwsh
# Save SSH credentials to OneDrive (mapped by college)
# Peadar Grant
# Use at your own risk!

# Check if .ssh folder exists locally
Write-Host "checking for local .ssh folder ... " -NoNewline
if ( -not $(Test-Path -Path "~/.ssh") ) {
	Write-Host "not found" -ForegroundColor Red
	throw "there is no local .ssh folder to copy from"
}
Write-Host "found" -ForegroundColor Green

# Check if drive mapped
$DriveLetter = "O"
Write-Host "checking if $DriveLetter is mapped ... " -NoNewline
$NetworkDrive = "$($DriveLetter):\"
if ( -not $(Test-Path -Path $NetworkDrive)) {
	Write-Host "not mapped" -ForegroundColor Red
	throw "drive $DriveLetter is not mapped on this computer!"
}
Write-Host "mapped" -ForegroundColor Green

# does the folder exist
$Folder = "ssh_credentials"
$FolderPath = "$($NetworkDrive)$Folder"
Write-Host "checking for folder $FolderPath ... " -NoNewline
if ( -not $(Test-Path -Path $FolderPath)) {
	New-Item -Path $NetworkDrive -Name $Folder -ItemType "directory"
	Write-Host "created" -ForegroundColor Yellow
} else {
	Write-Host "exists" -ForegroundColor Green
}

# copy files
Write-Host "copying files ... " -NoNewline
Copy-Item -Path "~/.ssh/*" -Destination $FolderPath -Recurse
Write-Host "done" -ForegroundColor Green

Write-Host "ssh credentials copied to $FolderPath" -ForegroundColor Green
