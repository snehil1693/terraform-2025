variable "sample" {
  default = "Hello World"
}

output "sample" {
  value = var.sample
}

# variable if it is combined with other string then we use ${}, it is called as interpolation for variable accessing
output "sample1" {
  value = "${var.sample} - From Terraform"
}

# if we don't provide the input then terraform will ask for the input for variable

variable "sample2" {}

output "sample2" {
  value = var.sample2
}