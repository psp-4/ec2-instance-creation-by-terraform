// This code will maintain the state in S3 bucket such that other developers can have access to it.
terraform {
  backend "s3" {
    bucket = "softsite-bucket-1"
    key    = "backend"
    region = "us-east-1"
  }
}