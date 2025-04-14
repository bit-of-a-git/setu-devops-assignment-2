packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "server" {
  ami_name      = "${var.server_type}-${local.timestamp}"
  instance_type = var.instance_type
  region        = var.region
  ssh_username  = var.ssh_username

  source_ami_filter {
    filters = {
      name                = var.ami_name_filter
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = [var.ami_owner]
  }
  launch_block_device_mappings {
    device_name           = var.root_volume
    volume_size           = var.root_volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
  tags = {
    Name = "${var.server_type}-${local.timestamp}"
  }
}

build {
  sources = [
    "source.amazon-ebs.server"
  ]

  provisioner "shell" {
    script = var.install_script
  }

  post-processor "manifest" {
    output = "../${var.server_type}.json"
  }
}

locals {
  timestamp = formatdate("YYYY-MM-DD_HH-mm-ss", timestamp())
}