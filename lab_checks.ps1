#!/usr/bin/env pwsh
# Checks for cloud setup lab

# commands expected
Write-Host "checking for required software:" -ForegroundColor Yellow
$commands = @( "git", "aws" )
foreach ( $command in $commands ) {
    Write-Host "checking for $command command... " -NoNewline
    if ( Get-command $command ) {
        Write-Host "OK" -ForegroundColor Green
    }
    else {
        Write-Host "not found" -ForegroundColor Red
        Write-Host "  -- install and re-run to continue checks"
    }

}
Write-Host "Required software is installed." -ForegroundColor Green

Write-Host "checking your AWS CLI setup:" -ForegroundColor Yellow

# files expected
$paths = @( "$HOME\.aws", "$HOME\.aws\config", "$HOME\.aws\credentials" )

# check for expected files
foreach ( $path in $paths ) {

if ( Test-Path $path ) {
    Write-Host "$path exists"
}
else {
    Write-Host "$path does not exist" -ForegroundColor Red
    Write-Host " ... fix this error and re-run"
    Return
    }

}

# confirm aws region
$required_region = "eu-west-1"
Write-Host "checking region is $required_region ... " -NoNewline
$region = (aws configure get region)
if ( $required_region -eq $region) {
    Write-Host "OK" -ForegroundColor Green
}
else {
    Write-Host "region is $region" -ForegroundColor Red
    Write-Host " ... fix this error and re-run"
    Return
}

# ensure that the aws CLI is operational
$output = (aws ec2 describe-host-reservations)
Write-Host "output from aws:"
Write-Host $output 
if ( "HostReservationSet" -in ($output | ConvertFrom-Json).PSObject.Properties.Name ) {
    Write-Host "aws CLI works OK" -ForegroundColor Green
    }
    else
    {
    Write-Host "aws CLI not working, fix and re-run" -ForegroundColor Red
    Return
    }
	
Write-Host "AWS CLI setup looks good" -ForegroundColor Green

Write-Host "checking your SSH keys:" -ForegroundColor Yellow

# files expected
$paths = @( "$HOME\.ssh", "$HOME\.ssh\id_rsa", "$HOME\.ssh\id_rsa.pub" )

# check for expected files
foreach ( $path in $paths ) {

if ( Test-Path $path ) {
    Write-Host "$path exists"
}
else {
    Write-Host "$path does not exist" -ForegroundColor Red
    Write-Host " ... load ssh key (or create them if you don't have them)"
    Return
    }

}

# check if key pair exists on AWS
$KeyPairName='MAIN_KEY'
Write-Host "checking for key pair named $KeyPairName ... " -NoNewline
$KeyPairs = $(aws ec2 describe-key-pairs | ConvertFrom-Json).KeyPairs
$KeyPairFound = $False
foreach ( $KeyPair in $KeyPairs) {
    if ( $KeyPair.KeyName -eq $KeyPairName )
    {
	$KeyPairFound=$True
	break
    }
}
if ( $KeyPairFound ) {
    Write-Host "found" -ForegroundColor Green
}
else {
    Write-Host "not found" -ForegroundColor Red
    Write-Host "import the key pair and try again" -ForegroundColor Red
    Return
}

Write-Host "SSH setup looks good" -ForegroundColor Green

# confirmation screen
Write-Host "Your setup is OK for working with AWS!" -ForegroundColor White -BackgroundColor DarkGreen

