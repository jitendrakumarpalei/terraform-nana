provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name: "development"
    vpc_env: "dev"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.10.0/24"
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
