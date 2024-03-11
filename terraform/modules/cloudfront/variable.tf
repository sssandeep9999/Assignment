variable "region" {
  description = "AWS region"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the CloudFront distribution"
  type        = string
}

variable "ec2_instance_domain_name" {
  description = "Domain name of the existing EC2 instance"
  type        = string
}
