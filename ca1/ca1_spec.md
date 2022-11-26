# Cloud Foundations CA1

**Weight:** 30/100

**Due:** as displayed on Moodle

## Introduction

This CA will showcase your skills developed in the Cloud Foundations module.

## Requirements

You are to deploy your choice of application on the AWS Cloud using EC2 (and/or other technologies).
This could be:
- A static HTML website
- A PHP/MySQL-based web application (your own, Wordpress, Moodle, other)
- A Java/.net web application
- A piece of windows software

### Design (20%)

You are to present your design in a file `design.pdf`.
Max 1 page, A4 sized.

### Cloud environment setup (20%)

You will set up required cloud resources (e.g. creating VPC, internet gateway etc) using a PowerShell script. 
Your script must be called `cloud_setup.ps1`. 

### Instance setup (20%)

You should provide the commands you used to setup the EC2 instance in the file 
`instance_setup.sh`.

### Demo (20%)

In the file `demo.txt` you should provide the instructions necessary to demonstrate your system. 
Aim to be short, clear, simple instructions.

### Teardown (20%)

Write a Powershell script to remove the resources that you created named `teardown.ps1`. 

## Submission

Place all files required above plus any additional needed for your solution in a ZIP folder named exactly `cloud_foundations_ca1.zip`.
Use `ca1_checks.ps1` to confirm your ZIP file meets requirements.

## Feedback

Summary written feedback will be given in Moodle.
Detailed verbal feedback is available on request in consultation.

