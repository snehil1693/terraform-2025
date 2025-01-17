resource "aws_instance" "sample" {
  ami                    = "ami-0b4f379183e5706b9"
  instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  vpc_security_group_ids = [var.SG_ID]

  tags                   = {
    Name                 = "Sample"
  }
}

variable "SG_ID" {}