# OpenTofu (Terraform) Remote State Configuration for SETU DevOps Assignment 2

This directory contains Terraform configuration files to set up the necessary resources for using AWS S3 as a backend for Terraform remote state management.

## Features

- Creates an S3 bucket to store Terraform state files.
- Configures versioning on the S3 bucket for state file history.
- Creates a DynamoDB table for state locking and consistency.

## Prerequisites

- [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured with sufficient permissions to create S3 buckets and DynamoDB tables.

## Usage

Replace "tofu" with "terraform" in the commands below if using Terraform.

1. Navigate to the remote state directory.
    ```bash
    cd remote-state
    ```

2. Initialise the project:
    ```bash
    tofu init
    ```

3. Create a terraform.tfvars file and populate with the following:
    ```tfvars
    aws_region          = "<your chosen AWS region here>
    s3_bucket_prefix    = <your chosen AWS bucket prefix here>
    dynamodb_table_name = <your chosen DynamoDB lock table name here>
    ```

3. Review and apply the configuration. Enter "yes" when asked:
    ```bash
    tofu apply
    ```

4. Run this command to pass the required remote state outputs to the main Terraform project, for use as its remote state.
    ```bash
    tofu output >> ../terraform/terraform.tfvars
    ```

## Cleanup

Before deleting the created resources, ensure that all resources in the main Terraform project are deleted and you no longer require the backend state resources.

To remove the created resources, first comment out the "prevent_destroy" lines in `main.tf`:

```hcl
# lifecycle {
#   prevent_destroy = true
# }
```

Next, run:
```bash
tofu destroy
```