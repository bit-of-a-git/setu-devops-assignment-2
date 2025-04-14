data "aws_ami" "db" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["setu-devops-database-*"]
  }
}

data "aws_ami" "latest_al2023" {
  most_recent = true
  name_regex  = "al2023-ami-*"
  owners      = ["137112412989"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ami" "web" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["setu-devops-web-*"]
  }
}

// https://github.com/eoinfennessy/devops-assignment-2-terraform-and-aws/blob/main/main.tf
data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}