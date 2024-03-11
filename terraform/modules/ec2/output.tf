output "public_ip" {
  description = "The public IP address of the deployed EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
