#!/usr/bin/env pwsh
# Load SSH credentials from OneDrive (mapped by college)
# Peadar Grant

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
		Write-Host "not found" -ForegroundColor Red
		throw "no remote $FolderPath folder to copy from"
}
Write-Host "exists" -ForegroundColor Green

# Check if .ssh folder exists locally
Write-Host "checking for local .ssh folder ... " -NoNewline
if ( -not $(Test-Path -Path "~/.ssh") ) {
	New-Item -Path "~/.ssh" -Name $Folder -ItemType "directory"
	Write-Host "created" -ForegroundColor Yellow
} else {
	Write-Host "exists" -ForegroundColor Green
}

# copy files
Write-Host "copying files ... " -NoNewline
$FilesToCopy = @( 'id_rsa')
foreach ( $FileToCopy in $FilesToCopy ) {
	Copy-Item -Path "$FolderPath\$FileToCopy" -Destination "~/.ssh" 
}
Write-Host "done" -ForegroundColor Green

Write-Host "ssh credentials copied to local machine" -ForegroundColor Green
