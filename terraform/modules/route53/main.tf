provider "aws" {
  region = var.region
}

resource "aws_route53_zone" "example_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "web_application_record" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = var.subdomain_name
  type    = "A"
  ttl     = 300
  records = [aws_cloudfront_distribution.web_application_distribution.domain_name]
}