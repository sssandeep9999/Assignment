output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "route53" {
  value = module.route53.domain_name
  
}

