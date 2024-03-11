provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  # Enable versioning for the bucket
  versioning {
    enabled = true
  }

  # Define the bucket policy
  policy = data.template_file.bucket_policy.rendered
}

data "template_file" "bucket_policy" {
  template = file("${path.module}/policy.json")

  vars = {
    bucket_name = var.bucket_name
  }
}