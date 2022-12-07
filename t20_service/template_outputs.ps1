$InstanceId = ((aws cloudformation describe-stacks --stack-name LAB | ConvertFrom-Json).Stacks[0].Outputs | Where-Object OutputKey -eq InstanceId).OutputValue
Write-Host $InstanceId

$PublicIp = ((aws cloudformation describe-stacks --stack-name LAB | ConvertFrom-Json).Stacks[0].Outputs | Where-Object OutputKey -eq PublicIp).OutputValue
Write-Host $PublicIp

$QueueUrl = ((aws cloudformation describe-stacks --stack-name LAB | ConvertFrom-Json).Stacks[0].Outputs | Where-Object OutputKey -eq QueueUrl).OutputValue
Write-Host $QueueUrl

$BucketName = ((aws cloudformation describe-stacks --stack-name LAB | ConvertFrom-Json).Stacks[0].Outputs | Where-Object OutputKey -eq BucketName).OutputValue
Write-Host $BucketName

