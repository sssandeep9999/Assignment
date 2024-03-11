output "record_dns_name" {
  value = aws_route53_record.web_application_record.fqdn
}
