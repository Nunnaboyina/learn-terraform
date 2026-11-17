variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"

}

variable "aws_zone_id" {
  default = "Z0858131H2G4LTDQGMIX"
}

variable "domain_name" {
    default = "saidevops.shop"
  
}
variable "instances" {

    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "cart", "user", "payment", "shipping", "frontend"]
    
 }
variable "ami_id" {
    type = string
    description = "AMI ID of the instance"
    default = "ami-0055977a6e828a4f4"
  
}

variable "instance_type" {
    type = string
    description = "Size of the remote machine instance"
    default = "t3.micro"

    validation {
      condition = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"],var.instance_type)
      error_message = "Instance_type must be from one of the values : t3.micro, t3.small, t3.medium, t3.large"
    }
  
}