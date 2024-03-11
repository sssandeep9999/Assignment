provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  security_groups = var.security_group_ids
  public_ip = aws_instance.ec2_instance.public_ip

  #user_data = var.user_data

  tags = {
    Name = "WebAppInstance"
  }

user_data = file("${path.module}/userdata.sh")
  #           (or)
  # user_data = <<EOF
  #               #!/bin/bash
  #               sudo yum update -y 
  #               sudo yum install -y docker
  #               sudo systemctl start docker
  #               sudo usermod -aG docker ec2-user
  #               sudo docker run -d -p 8081:80 nginx &
  #           EOF

}