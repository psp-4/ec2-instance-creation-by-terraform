// Regions
variable "REGION" {
  default = "us-east-1"
}

// Availability zones
variable "ZONE1" {
  default = "us-east-1a"
}

// Setting Amazon Machine Image IDs for different regions
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-03a6eaae9938c858c"
    us-east-2 = "ami-0d406e26e5ad4de53"
  }
}

// User name to login into instance during remote execution
variable "USER" {
  default = "ec2-user"
}

// My IP
variable "MYIP" {
  default = "49.37.112.17/32"
}
