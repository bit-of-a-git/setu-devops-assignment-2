output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.web_server.alb_dns_name
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion host"
  value       = module.bastion.public_ip
}

output "db_private_ip" {
  description = "The private IP address of the database instance"
  value       = module.db.private_ip
}