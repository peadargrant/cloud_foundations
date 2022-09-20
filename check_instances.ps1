#!/usr/bin/env pwsh
# Script to check running instances
# Peadar Grant

$Instances = $(aws ec2 describe-instances | ConvertFrom-Json).Reservations.Instances

foreach ( $Instance in $Instances ) {

	Write-Host "Instance running: $($Instance.InstanceId)"

}
