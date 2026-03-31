terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "kavyasri-vpc"
    Project = "terraform-aws-infra"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "kavyasri-public-subnet"
    Project = "terraform-aws-infra"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "kavyasri-igw"
    Project = "terraform-aws-infra"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "kavyasri-devops-project-bucket-2025"

  tags = {
    Name    = "kavyasri-bucket"
    Project = "terraform-aws-infra"
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name    = "kavyasri-web-server"
    Project = "terraform-aws-infra"
  }
}
