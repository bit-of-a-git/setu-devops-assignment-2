resource "aws_autoscaling_group" "this" {
  name                      = var.asg_name
  desired_capacity          = var.asg_desired_capacity
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  vpc_zone_identifier       = var.private_subnets
  target_group_arns         = [aws_lb_target_group.this.arn]
  health_check_type         = var.asg_health_check_type
  health_check_grace_period = var.health_check_grace_period

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "this" {
  name_prefix            = var.launch_template_prefix
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.app_security_group]

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  monitoring {
    enabled = var.detailed_monitoring
  }

  block_device_mappings {
    device_name = var.root_volume_name
    ebs {
      volume_size           = var.root_volume_size
      encrypted             = var.root_volume_encrypted
      delete_on_termination = var.root_volume_delete_on_termination
    }
  }
  user_data = var.user_data
}