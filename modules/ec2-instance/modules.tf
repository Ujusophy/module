# ./modules/ec2-instance/main.tf

provider "aws" {
  region = var.region
}

data "aws_ami" "latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

variable "region" {}
variable "instance_type" {}

resource "aws_instance" "this" {
  ami           = data.aws_ami.latest.id 
  instance_type = var.instance_type
  tags = {
    Name = "testing"
  }
}
