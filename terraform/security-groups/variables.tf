variable "alb_sg_name" {
  description = "Name of the ALB security group"
  type        = string
  default     = "alb-sg"
}

variable "app_sg_name" {
  description = "Name of the application server security group"
  type        = string
  default     = "app-server-sg"
}

variable "application_port" {
  description = "Port for the application server"
  type        = number
}

variable "bastion_sg_name" {
  description = "Name of the application server security group"
  type        = string
  default     = "bastion-server-sg"
}

variable "database_port" {
  description = "Port for the database server"
  type        = number
}

variable "db_sg_name" {
  description = "Name of the database security group"
  type        = string
  default     = "db-sg"
}

variable "ssh_ip" {
  description = "IP address for SSH access"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to create the security groups in"
  type        = string
}