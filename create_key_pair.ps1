#!/usr/bin/env pwsh
# Creates and stores key pair locally and to AWS

$KeyName="MAIN_KEY"
$KeyFile="~/.ssh/id_rsa"
$PublicKeyFile="$($KeyFile).pub"

Write-Host "deleting key $KeyName if exists ... " -NoNewline
aws ec2 delete-key-pair --key-name $KeyName
Write-Host "ok" -ForegroundColor Green

Write-Host "creating local key pair ... " -NoNewline
ssh-keygen -trsa -b2048 -mpem  -N '""' 
Write-Host "ok" -ForegroundColor Green

Write-Host "importing key pair to AWS ... " -NoNewline
aws ec2 import-key-pair --key-name $KeyName --public-key-material file://$PublicKeyFile
Write-Host "ok" -ForegroundColor Green

Write-Host "created SSH key pair on AWS" -ForegroundColor Green

