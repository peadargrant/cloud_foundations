#!/usr/bin/env pwsh
# script to setup lab VPC for EC2 Windows lab (uses CloudFormation internally)
# Peadar Grant

$KeyPairName = "MAIN_KEY"

$KeyPairs=(aws ec2 describe-key-pairs --filters Name=key-name,Values=$KeyPairName | ConvertFrom-Json).KeyPairs
if ( $KeyPairs.Count -ne 1 ) {
   throw "must be exactly 1 key pair named $KeyPairName (found $($KeyPairs.Count))."
}
Write-Host "KeyPair: $($KeyPairs[0].KeyPairId)"

$Stacks=(aws cloudformation describe-stacks | ConvertFrom-Json).Stacks
foreach ( $Stack in $Stacks ) {
    if ( $StackName -eq $Stack.StackName ) {
	throw "stack $StackName already exists - setup already done!"
    }
}

$Vpcs=(aws ec2 describe-vpcs --filter Name=tag:Name,Values=LAB_VPC | ConvertFrom-Json).Vpcs

if ( $Vpcs.Count -ge 1 ) {
    throw "found $($Vpcs.Count) VPCs named LAB_VPC - delete this first before continuing"
}

$StackName = "LAB-STACK"

Write-Host "Creating stack..." 
aws cloudformation create-stack --stack-name $StackName --template-body file://ec2_windows_template.yml
Write-Host "Done!" -ForegroundColor Green

