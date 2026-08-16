data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

locals {
  user_data = base64encode(templatefile("${path.module}/user_data.sh.tftpl", {
    docker_image = var.docker_image
  }))
}

resource "aws_launch_template" "this" {
  name_prefix   = "${var.name_prefix}-lt-"
  image_id      = data.aws_ami.al2023.id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]

  user_data = local.user_data

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = false
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name_prefix}-web"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "${var.name_prefix}-web"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "${var.name_prefix}-asg"
  vpc_zone_identifier       = var.subnet_ids
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 180

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-web"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
