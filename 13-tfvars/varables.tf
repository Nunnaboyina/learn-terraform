# variable "ami_id" {
#     type = string
#     #default = "ami-0055977a6e828a4f4"
#     #default = data.aws_ami.joindevops.id
#     description = "ami id for an instance"
# }

variable "instance_type" {
    type = string
     }

variable "environment" {
    type = string
     }

variable "ec2-tags" {
    type = map
    default = {
        Name = "roboshop-tfvars"
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "cidr" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}