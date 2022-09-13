# Load AWS credentials from OneDrive (mapped by college)
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
$Folder = "aws_credentials"
$FolderPath = "$($NetworkDrive)$Folder"
Write-Host "checking for folder $FolderPath ... " -NoNewline
if ( -not $(Test-Path -Path $FolderPath)) {
		Write-Host "not found" -ForegroundColor Red
		throw "no remote $FolderPath folder to copy from"
}
Write-Host "exists" -ForegroundColor Green

# Check if .aws folder exists locally
Write-Host "checking for local .aws folder ... " -NoNewline
if ( -not $(Test-Path -Path "~/.aws") ) {
	New-Item -Path $NetworkDrive -Name $Folder -ItemType "directory"
	Write-Host "created" -ForegroundColor Yellow
} else {
	Write-Host "exists" -ForegroundColor Green
}

# copy files
Write-Host "copying files ... " -NoNewline
Copy-Item -Path "$FolderPath/*" -Destination "~/.aws" -Recurse
Write-Host "done" -ForegroundColor Green

Write-Host "aws credentials copied to local machine" -ForegroundColor Green
