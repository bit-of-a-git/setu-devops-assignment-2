variable "app_cookie_name" {
  description = "Name of the application cookie"
  type        = string
  sensitive   = true
}

variable "app_cookie_password" {
  description = "Password for the application cookie"
  type        = string
  sensitive   = true
}

variable "append_string" {
  description = "A string to append to the resource names."
  type        = string
}

variable "application_port" {
  description = "Port for the application server"
  type        = number
  default     = 3000
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the Auto Scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size for the Auto Scaling group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum size for the Auto Scaling group"
  type        = number
}

variable "aws_provider_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "az_1" {
  description = "The first availability zone."
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "The second availability zone."
  type        = string
  default     = "us-east-1b"
}

variable "az_3" {
  description = "The third availability zone."
  type        = string
  default     = "us-east-1c"
}

variable "backend_s3_bucket_name" {
  description = "The S3 bucket key for the Terraform state file."
  type        = string
}

variable "backend_s3_key" {
  description = "The S3 bucket key for the Terraform state file."
  type        = string
}

variable "backend_aws_region" {
  description = "The AWS region where the S3 backend bucket is located."
  type        = string
}

variable "backend_dynamodb_table" {
  description = "The name of the DynamoDB table for state locking."
  type        = string
}

variable "bastion_instance_type" {
  description = "Type of instance for the bastion server"
  type        = string
  default     = "t2.nano"
}

variable "cloudinary_key" {
  description = "API key for the cloudinary account"
  type        = string
  sensitive   = true
}

variable "cloudinary_name" {
  description = "Name of the cloudinary product environment"
  type        = string
  sensitive   = true
}

variable "cloudinary_secret" {
  description = "API secret for the cloudinary account"
  type        = string
  sensitive   = true
}

variable "database_instance_type" {
  description = "Type of instance for the database server"
  type        = string
  default     = "t2.nano"
}

variable "database_port" {
  description = "Port for the database server"
  type        = number
  default     = 27017
}

variable "database_subnet_cidr_1" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "10.0.6.0/24"
}

variable "database_subnet_cidr_2" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "10.0.7.0/24"
}

variable "database_subnet_cidr_3" {
  description = "The CIDR block for the third private subnet."
  type        = string
  default     = "10.0.8.0/24"
}

variable "default_project_tag" {
  description = "Default tag for all resources"
  type        = string
  default     = "terraform-aws-application"
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access to the instance"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_2" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_subnet_cidr_3" {
  description = "The CIDR block for the third private subnet."
  type        = string
  default     = "10.0.5.0/24"
}

variable "public_subnet_cidr_1" {
  description = "The CIDR block for the first public subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_2" {
  description = "The CIDR block for the second public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_3" {
  description = "The CIDR block for the third public subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_instance_type" {
  description = "Instance type for the web server"
  type        = string
  default     = "t2.nano"
}

variable "web_server_instance_profile_name" {
  description = "IAM instance profile name for the web server"
  type        = string
}