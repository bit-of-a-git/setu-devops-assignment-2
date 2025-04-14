# SETU DevOps Assignment 2

This parent directory contains my overall work for the SETU DevOps Assignment 2, which focuses on the deployment and automated management of a load-balanced auto-scaling web application in an AWS Academy account.

## Repository Structure

This repository is organized into the following subfolders:

- `/packer`: This folder contains Packer templates and scripts used for step 1 of the assignment (creating master instances/AMIs for a web application). It additonally contains a configuration which may be used to install a MongoDB database on EC2.
- `/remote-state`: Following best practice, this folder contains a Terraform configuration for setting up remote state management using AWS S3 and DynamoDB. This is used to store the Terraform state file securely and enable collaboration.
- `/terraform`: This folder contains Terraform configurations for setting up the infrastructure required for the web application, including VPC, security groups, load balancers, auto-scaling groups, and more. It also includes configurations for setting up CloudWatch alarms and scaling policies.

Each subfolder includes a dedicated README file with detailed information about its contents and usage.

## Getting Started

The subfolders should be used in the following order:
1. `/packer`: Create AMIs for your web application and MongoDB database.
2. `/remote-state`: Set up remote state management to ensure that your Terraform state file is stored securely.
3. `/terraform`: Set up the infrastructure for your web application, including VPC, security groups, load balancers, auto-scaling groups, and CloudWatch alarms. By default, this uses the AMIs created in the `/packer` step, and uses my Full Stack 1 Assignment 1 project.

## Credits

I referenced previous DevOps Assignment 2 submissions by former SETU students Peter Fortune, Kieron Garvey, and Eoin Fennessy. 

- https://github.com/pfortune/aws-devops-terraform/tree/main
- https://github.com/ki321g/DevOPS-Assignment-2
- https://github.com/eoinfennessy/devops-assignment-2-terraform-and-aws

I also referenced my previous Terraform projects, such as:

- https://github.com/bit-of-a-git/cloud-resume-challenge-front-end
- https://github.com/bit-of-a-git/cloud-resume-challenge-back-end