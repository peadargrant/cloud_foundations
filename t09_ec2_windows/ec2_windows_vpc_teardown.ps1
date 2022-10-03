#!/usr/bin/env pwsh
# script to tear down VPC for EC2 Windows lab (uses CloudFormation internally)
# Peadar Grant

$StackName="LAB-STACK"

# check for running instances
$Stack=(aws cloudformation describe-stacks --stack-name LAB-STACK | ConvertFrom-Json).Stacks[0]

$VpcId=($Stack.Outputs | Where-Object -Property OutputKey -eq VpcId).OutputValue
Write-Host "VpcId: $VpcId"

$Instances = (aws ec2 describe-instances --filters Name=vpc-id,Values=$VpcId | ConvertFrom-Json).Reservations[0].Instances
foreach ( $Instance in $Instances ) {
	Write-Host $Instance.InstanceId
	if ( "running" -eq $Instances.State.Name ) {
		throw "instance still running"
	}
}

# do the delete otherwise
Write-Host "Deleting stack..." 
aws cloudformation delete-stack --stack-name $StackName 
Write-Host "Done!" -ForegroundColor Green


