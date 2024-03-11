provider "aws" {
  region = var.region
}

resource "aws_autoscaling_group" "example_asg" {
  name                 = "example-asg"
  launch_configuration = aws_launch_configuration.example_lc.name
  min_size             = var.autoscaling_min_size
  max_size             = var.autoscaling_max_size
  desired_capacity     = var.autoscaling_desired_size
  availability_zones   = ["us-east-1a"]

  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "example_lc" {
  name_prefix   = "example-lc-"
  image_id      = var.ec2_ami_id
  instance_type = "t2.micro"
}