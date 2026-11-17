# variable "ami_id" {
#     type = string
#     #default = "ami-0055977a6e828a4f4"
#     #default = data.aws_ami.joindevops.id
#     description = "ami id for an instance"
# }

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "Type of instance for EC2"

    validation {
      condition = contains(["t3.micro","t3.small","t3.large","t3.medium"],var.instance_type)
      error_message = "The instance_type must be one of : t3.micro, t3.small, t3.medium, t3.large"
    }
}

variable "ec2-tags" {
    type = map
    default = {
        Name = "roboshop-mongodb"
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
        Component = "mongodb" 
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