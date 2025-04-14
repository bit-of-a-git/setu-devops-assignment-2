resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Allows inbound HTTP traffic from the internet and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allows HTTP traffic from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allows HTTPS traffic from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allows all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_sg_name
  }
}

resource "aws_security_group" "app_sg" {
  name        = var.app_sg_name
  description = "Allows inbound traffic from the ALB SG on the application port, SSH from the bastion host, and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allows ingress on the app port from the ALB SG"
    from_port       = var.application_port
    to_port         = var.application_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description     = "Allows SSH traffic from the bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    description = "Allows all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_sg_name
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = var.bastion_sg_name
  description = "Allowd inbound SSH from a specified IP address and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allows SSH from an IP"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh_ip}/32"]
  }

  egress {
    description = "Allows all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bastion_sg_name
  }
}

resource "aws_security_group" "db_sg" {
  name        = var.db_sg_name
  description = "Allow database access from application server SG, SSH from the bastion host, and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allows database traffic from app SG"
    from_port       = var.database_port
    to_port         = var.database_port
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  ingress {
    description     = "Allows SSH traffic from the bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    description = "Allows all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name
  }
}
