variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instances"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs for EC2 instances"
  type        = list(string)
}

variable "autoscaling_min_size" {
  description = "Minimum size of Auto Scaling group"
  type        = number
}

variable "autoscaling_max_size" {
  description = "Maximum size of Auto Scaling group"
  type        = number
}

variable "autoscaling_desired_capacity" {
  description = "Desired capacity of Auto Scaling group"
  type        = number
}

variable "cloudfront_domain_name" {
  description = "Domain name for CloudFront distribution"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "Domain name for Route 53"
  type        = string
}
