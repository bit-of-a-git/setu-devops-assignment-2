variable "alb_name" {
  description = "Name for the ALB"
  type        = string
  default     = "web-alb"
}

variable "alb_security_group" {
  description = "Security group for the ALB"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the web server"
  type        = string
}

variable "app_security_group" {
  description = "Security group for the application servers"
  type        = string
}

variable "application_port" {
  description = "Port for the application server"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the autoscaling group"
  type        = number
  default     = 2
}

variable "asg_health_check_type" {
  description = "Health check type for the autoscaling group"
  type        = string
  default     = "ELB"
}

variable "asg_max_size" {
  description = "Maximum capacity for the autoscaling group"
  type        = number
  default     = 3
}

variable "asg_min_size" {
  description = "Minimum capacity for the autoscaling group"
  type        = number
  default     = 1
}

variable "asg_name" {
  description = "Name for the autoscaling group"
  type        = string
  default     = "web-asg"
}

variable "detailed_monitoring" {
  description = "Whether detailed monitoring is enabled for the instance"
  type        = bool
  default     = false
}

variable "health_check_grace_period" {
  description = "Health check grace period for the autoscaling group instances"
  type        = number
  default     = 300
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name for the instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Instance type for the web server"
  type        = string
  default     = "t2.nano"
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access to the instance"
  type        = string
}

variable "launch_template_prefix" {
  description = "Prefix for the launch template name"
  type        = string
  default     = "web-launch-template"
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "root_volume_delete_on_termination" {
  description = "Whether to delete the root volume on termination"
  type        = bool
  default     = true
}

variable "root_volume_encrypted" {
  description = "Whether the root volume is encrypted"
  type        = bool
  default     = true
}

variable "root_volume_name" {
  description = "The root volume device name for the web server. Used to override the default EBS volume size."
  type        = string
  default     = "/dev/xvda"
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
  default     = 15
}

variable "stickiness_duration" {
  description = "Duration for the stickiness cookie in seconds"
  type        = number
  default     = 86400
}

variable "stickiness_enabled" {
  description = "Whether to enable stickiness for the target group"
  type        = bool
  default     = false
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
  default     = "web-target-group"
}

variable "user_data" {
  description = "User data script for the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}