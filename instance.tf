// Create a keypair for the instance
// The public and private keys have been generated using ssh-keygen command.
resource "aws_key_pair" "soft-key" {
  key_name   = "softkey"
  public_key = file("soft-landing.pub")
}

// Create an EC2 instance in AWS Cloud
resource "aws_instance" "soft-landing-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.soft-key.key_name
  vpc_security_group_ids = [aws_security_group.softsite-sg.id]
  tags = {
    Name    = "Soft-Landing Web Page"
    Project = "Web Hosting"
  }

  // Send the script file to the remote machine for remote execution
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  // Provision the remote machine with the script file
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh", // Give the current user executable permission
      "sudo /tmp/web.sh"       // Execute the script
    ]
  }

  // Authorize terraform to connect to the remote machine
  connection {
    user        = var.USER
    private_key = file("soft-landing")
    host        = self.public_ip // Public IP of the created instance
  }
}

// Print the private IP of the instance
output "PrivateIP" {
  value = aws_instance.soft-landing-instance.private_ip
}

// Print the public IP of the instance
output "PublicIP" {
  value = aws_instance.soft-landing-instance.public_ip
}