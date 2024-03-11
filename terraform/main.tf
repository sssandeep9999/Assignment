provider "aws" {
  region = "us-east-1"
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = "prodioslabs_assignment"
}

module "ec2" {
  source = "./modlues/ec2"
  aws_region = "us-east-1"
  ami_id = "enter ami id"
  instance_type = "enter instance type"
  key_name = "enter pem key name"
  security_group_ids = "enter SG ID"
  subnet_id = "enter subnet ID"
}

module "autoscaling" {
  source                  = "./modules/autoscalling"
  min_size                = 1
  max_size                = 4
  desired_capacity        = 3
  launch_configuration_id = module.ec2.launch_configuration_id
}

module "cloudfront" {
  source = " ./modules/cloudfront"
  domain_name = "Ex:-prodioslabs.com"
  ec2_instance_domain_name = "example.com" # Replace with your EC2 instance's domain name


module "route53" {
  source             = " ./modules/route53"
  cloudfront_domain  = module.cloudfront.domain_name
  region = "us-east-1"
  domain_name = "prodioslabs.com"
  subdomain_name = "webapp"
}