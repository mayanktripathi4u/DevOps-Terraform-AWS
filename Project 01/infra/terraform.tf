terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
    }
  }
  backend "s3" {
    key = "aws/myTerraform/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "name" {
  ami = "ami-0354hXyy"
  instance_type = "t2.micro"
  key_name = aws_key_pair.awsKeyPair.key_name
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = var.private_key
    timeout = "4m"
  }
  tags = {
    "Name" = "DeployVM"
  }
}

resource "aws_security_group" "awssg" {
  egress = [
    {
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        from_port = 0
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "-1"
        security_groups = []
        self = false
        to_port = 0
    }
  ]
  ingress = [ 
    {
        cidr_blocks = ["0.0.0.0/0", ]
        description = ""
        from_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 22
    }
   ]
}

resource "aws_key_pair" "awsKeyPair" {
  
}