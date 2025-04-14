variable "ami_name_filter" {
  description = "The AMI name filter to use for the base AMI"
  type        = string
  default     = "al2023-ami-*-x86_64"
}

variable "ami_owner" {
  description = "The owner of the base AMI"
  type        = string
  default     = "137112412989"
}

variable "install_script" {
  description = "The path to the installation script"
  type        = string
  default     = "./scripts/web-server.sh"
}

variable "instance_type" {
  description = "The instance type to use for the AMI"
  type        = string
  default     = "t2.nano"
}

variable "region" {
  description = "The AWS region to use for the AMI"
  type        = string
  default     = "us-east-1"
}

variable "root_volume" {
  description = "The device name of the root volume"
  type        = string
  default     = "/dev/xvda"
}

variable "root_volume_size" {
  description = "The instance type to use for the AMI"
  type        = number
  default     = 2
}

variable "server_type" {
  description = "The intended function of the AMI"
  type        = string
  default     = "setu-devops-generic"
}

variable "ssh_username" {
  description = "The SSH username to use for the AMI"
  type        = string
  default     = "ec2-user"
}

variable "volume_type" {
  description = "The volume type to use for the AMI"
  type        = string
  default     = "gp3"
}