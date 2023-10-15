// Creating a security group for Soft Landing Page
resource "aws_security_group" "softsite-sg" {
  name        = "softsite-sg"
  description = "Network rules for softsite"
  vpc_id      = data.aws_vpc.default.id
  
  // Allow incoming traffic on port 80 from anywhere
  ingress {
    description = "Allow traffic from my IP on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow incoming traffic on port 22 from user's IP only
  ingress {
    description = "Allow traffic from my IP on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  // Allow all outgoing traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Softsite-SG"
  }
}