module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.19.0"

  name = "${var.append_string}-vpc"

  azs              = [var.az_1, var.az_2, var.az_3]
  cidr             = var.vpc_cidr
  public_subnets   = [var.public_subnet_cidr_1, var.public_subnet_cidr_2, var.public_subnet_cidr_3]
  private_subnets  = [var.private_subnet_cidr_1, var.private_subnet_cidr_2, var.private_subnet_cidr_3]
  database_subnets = [var.database_subnet_cidr_1, var.database_subnet_cidr_2, var.database_subnet_cidr_3]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false
}

module "security_groups" {
  source           = "./security-groups"
  vpc_id           = module.vpc.vpc_id
  application_port = var.application_port
  database_port    = var.database_port
  ssh_ip           = data.http.my_ip.response_body

  alb_sg_name     = "${var.append_string}-alb-sg"
  app_sg_name     = "${var.append_string}-app-sg"
  bastion_sg_name = "${var.append_string}-bastion-sg"
  db_sg_name      = "${var.append_string}-db-sg"
}

module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.8.0"

  name          = "${var.append_string}-bastion"
  ami           = data.aws_ami.latest_al2023.id
  instance_type = var.bastion_instance_type

  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security_groups.bastion_security_group_id]
}

module "db" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.8.0"

  name          = "${var.append_string}-database"
  ami           = data.aws_ami.db.id
  instance_type = var.database_instance_type

  key_name               = var.key_name
  subnet_id              = module.vpc.database_subnets[0]
  vpc_security_group_ids = [module.security_groups.db_security_group_id]
  user_data              = file("${path.module}/user-data/database.sh")
}

module "web_server" {
  source                    = "./web-server"
  ami_id                    = data.aws_ami.web.id
  instance_type             = var.web_instance_type
  iam_instance_profile_name = var.web_server_instance_profile_name

  key_name        = var.key_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets

  alb_security_group = module.security_groups.alb_security_group_id
  app_security_group = module.security_groups.app_security_group_id
  application_port   = var.application_port

  asg_desired_capacity = var.asg_desired_capacity
  asg_max_size         = var.asg_max_size
  asg_min_size         = var.asg_min_size
  detailed_monitoring  = true

  asg_name               = "${var.append_string}-web-asg"
  alb_name               = "${var.append_string}-web-alb"
  launch_template_prefix = "${var.append_string}-web-launch-template"
  target_group_name      = "${var.append_string}-web-target-group"

  stickiness_enabled  = true
  stickiness_duration = 86400

  user_data = base64encode(templatefile("${path.module}/user-data/webserver.sh", {
    APP_COOKIE_NAME     = var.app_cookie_name,
    APP_COOKIE_PASSWORD = var.app_cookie_password,
    DB_PRIVATE_IP       = module.db.private_ip,
    CLOUDINARY_NAME     = var.cloudinary_name,
    CLOUDINARY_KEY      = var.cloudinary_key,
    CLOUDINARY_SECRET   = var.cloudinary_secret,
    BUCKET_DOMAIN_NAME  = aws_s3_bucket.scripts.bucket_regional_domain_name,
  }))
}
