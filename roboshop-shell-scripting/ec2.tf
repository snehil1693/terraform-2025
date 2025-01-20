# resource "aws_instance" "instances" {
#   ami                = "ami-0b4f379183e5706b9"
#   instance_type      = "t2.micro"
# }

resource "aws_spot_instance_request" "instances" {
  count                = local.LENGTH
  ami                  = "ami-0b4f379183e5706b9"
  spot_price           = "0.0037"
  instance_type        = "t2.micro"
  wait_for_fulfillment = true


  tags                 = {
    Name               = element(var.COMPONENTS, count.index)
  }
}

resource "aws_ec2_tag" "name-tag" {
  count                = local.LENGTH
  resource_id          = element(aws_spot_instance_request.instances.*.spot_instance_id, count.index)
  key                  = "Name"
  value                = element(var.COMPONENTS, count.index)
}

resource "null_resource" "run_shell_scripting" {
  count                = local.LENGTH
  provisioner "remote-exec" {
    connection {
      host             =   element(aws_spot_instance_request.instances.*.public_ip, count.index)
      user             = "centos"
      password         = "DevOps321"
    }

    inline             = [
      "cd /home/centos",
      "git clone https://github.com/snehil1693/shell-scripting-2025.git",
      "cd shell-scripting/roboshop",
      "sudo make ${element(var.COMPONENTS, count.index)}"
    ]
  }
}

locals {
  LENGTH              = length(var.COMPONENTS)
}