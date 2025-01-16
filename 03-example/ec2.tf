# resource "aws_instance" "sample" {
#   ami                 = "ami-0b4f379183e5706b9"
#   instance_type       = "t2.micro"
#   vpc_security_group_ids = []
#
#   tags                = {
#     Name              = "Sample"
#   }
# }

resource "aws_security_group" "allow_ssh" {
  name                = "allow_ssh"
  description         = "allow_ssh"

  ingress {
    description       = "SSH"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
    from_port         = 0
    to_port           = 65535
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  tags = {
    Name              = "allow_tls"
  }

}

output "sg-attributes" {
  value = aws_security_group.allow_ssh
}

provider "aws" {
  region = "us-east-1"
}