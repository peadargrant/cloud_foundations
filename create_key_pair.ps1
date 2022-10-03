#!/usr/bin/env pwsh
# Creates and stores key pair from AWS

$KeyName="MAIN_KEY"
$KeyFile="~/.ssh/id_rsa"

Write-Host "deleting key $KeyName if exists ... " -NoNewline
aws ec2 delete-key-pair --key-name $KeyName
Write-Host "ok" -ForegroundColor Green

Write-Host "creating key pair on AWS ... " -NoNewline
$Key=(aws ec2 create-key-pair --key-name $KeyName | ConvertFrom-Json)
Write-Host "ok" -ForegroundColor Green

Write-Host "saving private key file to $KeyFile ... " -NoNewline
$Key.KeyMaterial | Out-File $KeyFile
Write-Host "ok" -ForegroundColor Green

Write-Host "created SSH key pair on AWS" -ForegroundColor Green

./save_key_to_onedrive.ps1

