variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "s3_bucket_prefix" {
  description = "The prefix to use for the S3 bucket. Helps ensure global uniqueness."
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
}