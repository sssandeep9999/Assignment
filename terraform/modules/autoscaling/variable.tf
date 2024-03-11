variable "region" {
  description = "AWS region"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the web application"
  type        = string
}

variable "subdomain_name" {
  description = "Subdomain name for the web application"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "autoscaling_min_size" {
  description = "minimum size of Auto scaling"
}

variable "autoscaling_max_size" {
  description = "max size of Auto scaling"
}

variable "autoscaling_desired_size" {
  description = "Desired capacity of Auto scaling"
}