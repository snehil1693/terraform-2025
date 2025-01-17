resource "aws_instance" "sample" {
  ami                    = "ami-0b4f379183e5706b9"
  instance_type          = "t2.micro"
  tags                   = {
    Name                 = "Sample"
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket               = "snehil-2025"
    key                  = "sample/terraform.tfstate"
    region               = "us-east-1"
  }
}