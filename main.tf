provider "aws" {
  region = "us-east-2"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default = "10.0.10.0/24"
  type = string
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  
}

variable "environment" {
  description = "deployment environment"
  
}

variable availability_zone {}
  

resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: var.environment
    vpc_env: "dev"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-2a"
   tags = {
    Name: "subnet-1-development"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
   
}


resource "aws_subnet" "my-vpc1" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  availability_zone = "us-east-2a"
   tags = {
    Name: "subnet-1-default"
  }
  
}

output "dev-vpc-id" {
  value = aws_vpc.my-vpc.id
  
}

output "dev-subnet-id" {
  value = aws_subnet.my-subnet.id
  
}