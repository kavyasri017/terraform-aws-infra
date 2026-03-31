# Terraform AWS Infrastructure

Provisioned AWS infrastructure using Terraform from an EC2 instance.

## Resources Created
- VPC with DNS support enabled
- Public Subnet in ap-south-1a
- Internet Gateway
- EC2 instance (t2.micro)
- S3 Bucket

## Tools Used
- Terraform 5.x
- AWS (EC2, VPC, S3, IAM Role)
- Amazon Linux 2023

## How to Run
1. Clone this repo
2. Run terraform init
3. Run terraform plan
4. Run terraform apply
