provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-2a"
}