#!/usr/bin/env pwsh
# script to tear down VPC for EC2 Windows lab (uses CloudFormation internally)
# Peadar Grant

$StackName="LAB-STACK"

Write-Host "Deleting stack..." 
aws cloudformation delete-stack --stack-name $StackName 
Write-Host "Done!" -ForegroundColor Green


