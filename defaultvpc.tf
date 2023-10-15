// Reading the AWS default VPC
data "aws_vpc" "default" {
  default = true
}