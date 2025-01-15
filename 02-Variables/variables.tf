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

#Variable datatypes

variable "string" {
  default = "Hello World"
}

variable "Numbers" {
  default = 100
}

variable "boolean" {
  default = false
}

output "datatypes" {
  value = "String = ${var.string} , Number = ${var.Numbers} , Boolean = ${var.boolean}"
}

# Variables Types

variable "Training" {
  default = "DevOps"
}

variable "Trainings" {
  default = [ "Devops" , "AWS" ]
}

variable "Training-Details" {
  default = {
    AWS = "6AM EST"
    DEVOPS = "8AM EST"
  }
}

output "Training" {
  value = var.Training
}

output "Fisrt-Training" {
  value = var.Trainings[0]
}

output "Second-Training" {
  value = var.Trainings[1]
}

output "Training-Details" {
  value = "AWS Timing - ${var.Training-Details["AWS"]}"
}

# So far we have declared value in variable block, we can use different source also
# We can use the terraform.tfvars file for variables.

variable "Fruits" {}

output "Fruits" {
  value = var.Fruits
}

# we can give the variable value from the cli also

variable "Country" {}

output "Country" {
  value = var.Country
}



