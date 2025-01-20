# resource "aws_instance" "instances" {
#   ami                = "ami-0b4f379183e5706b9"
#   instance_type      = "t2.micro"
# }

resource "aws_spot_instance_request" "instances" {
  count                = length(var.COMPONENTS)
  ami                  = "ami-0b4f379183e5706b9"
  spot_price           = "0.0037"
  instance_type        = "t2.micro"
  wait_for_fulfillment = true


  tags                 = {
    Name               = element(var.COMPONENTS, count.index)
  }
}

resource "aws_ec2_tag" "name-tag" {
  count                = length(var.COMPONENTS)
  resource_id          = element(aws_spot_instance_request.instances.*.spot_instance_id, count.index)
  key                  = "Name"
  value                = element(var.COMPONENTS, count.index)
}