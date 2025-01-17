resource "aws_instance" "sample" {
  count                  =  2
  ami                    = "ami-0b4f379183e5706b9"
  instance_type          = var.TYPE
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  vpc_security_group_ids = [var.SG_ID]

  tags                   = {
    Name                 = "Example-${count.index}"
  }
}

variable "SG_ID" {}
variable "TYPE" {}

output "PRIVATE_IP" {
  value = aws_instance.sample.*.private_ip
}