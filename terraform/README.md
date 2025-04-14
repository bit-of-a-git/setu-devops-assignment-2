# OpenTofu/Terraform Project for SETU DevOps Assignment 2

This folder contains the Terraform infrastructure files for **Assignment 2** of the SETU HDip Year 2 DevOps module. The configuration is designed to provision and manage cloud resources.

## Prerequisites

- [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured with sufficient permissions to create resources such as EC2 instances, VPCs, and ACM certificates.

## Folder Structure

```bash
terraform/
├── data-sources.tf       # Contains data sources to fetch latest AMIs and IP address of the user
├── main.tf               # Defines the main infrastructure resources, including a VPC, subnets, and EC2 instances
├── outputs.tf            # Outputs the public IP of the load balancer
├── providers.tf          # Defines the provider configuration
├── README.md             # This file
├── s3.tf                 # Creates an S3 bucket and uploads the custom metrics script to it
├── security-groups       # Contains security group configurations
│   ├── main.tf           # Defines security groups for the application
│   ├── output.tf         # Outputs the security group IDs
│   └── variables.tf      # Variable definitions for security groups
├── user-data             # Contains user data scripts for EC2 instances
│   ├── custom-metrics.sh # A script which pushes custom metrics to CloudWatch
│   ├── database.sh       # A script which configures and starts the database
│   └── webserver.sh      # A script which fetches the metrics script, configures cron to run it, fetches my project's GitHub repository, configures a .env file, and starts the Node.js application
├── variables.tf          # Variable definitions for the main configuration
└── web-server            # Contains web server configurations
    ├── alb.tf            # Defines the Application Load Balancer (ALB), listeners, and target groups
    ├── certificate.tf    # Creates a self-signed certificate for the ALB and uploads it to ACM
    ├── cloudwatch.tf     # Creates CloudWatch alarms used for auto-scaling the web server
    ├── main.tf           # Defines an auto-scaling group and launch template for the web server
    ├── outputs.tf        # Outputs the ALB DNS name and security group IDs
    └── variables.tf      # Variable definitions for the web server configuration
```

## Usage

1. Initialise the project:
    ```bash
    tofu init
    ```

2. Please ensure you have followed the [remote state README.md](../remote-state/README.md) and populated your `terraform.tfvars` with:
    ```tfvars
    backend_aws_region
    backend_dynamodb_table
    backend_s3_bucket_name
    ```

3. Additionally populate your `terraform.tfvars` with the following, filling in your desired values:
    ```tfvars
    append_string                    =
    asg_desired_capacity             =
    asg_max_size                     =
    asg_min_size                     =
    backend_s3_key                   =
    backend_aws_region               =
    backend_s3_bucket_name           =
    backend_dynamodb_table           =
    app_cookie_name                  =
    app_cookie_password              =
    cloudinary_name                  =
    cloudinary_key                   =
    cloudinary_secret                =
    default_project_tag              =
    web_server_instance_profile_name =
    ```

4. Validate the configuration*:
    ```bash
    tofu validate
    ```

5. Plan the infrastructure:
    ```bash
    tofu plan
    ```

6. Apply the configuration:
    ```bash
    tofu apply
    ```

7. When complete, you will see the DNS name of the load balancer in the output. You can access your application using this address.

7. When finished, you may destroy the infrastructure using:
    ```bash
    tofu destroy
    ```

## Outputs

The `outputs.tf` file defines the values that will be displayed after the infrastructure is provisioned.