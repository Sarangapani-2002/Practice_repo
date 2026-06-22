terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.45.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "My-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Tera-VPC"
  }
}
resource "aws_subnet" "Public_sub" {
    vpc_id = aws_vpc.My-VPC.id
  cidr_block       = "10.0.0.0/24"

  tags = {
    Name = "Tera-Public-Subnet"
  }
}
resource "aws_subnet" "Private_sub" {
    vpc_id = aws_vpc.My-VPC.id
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Tera-Private-Subnet"
  }
}
