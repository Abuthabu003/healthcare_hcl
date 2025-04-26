provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "hcl-healthcare-project"

  lifecycle {
    prevent_destroy = false
  }
}
