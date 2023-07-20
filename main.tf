provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "no-code" {
    ami = "ami-0e1c5be2aa956338b"
    instance_type = "t2.micro"
    tags = {
    Name = var.vm_name
  }
}