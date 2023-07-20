provider "aws" {
  region = "us-east-2"
}

# Data source to get the latest Amazon Linux 2 AMI ID for the selected region
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "no-code" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  tags = {
    Name = var.vm_name
  }
}