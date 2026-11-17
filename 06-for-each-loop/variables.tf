variable "ami_id" {
    default = "ami-0055977a6e828a4f4"
  
}

variable "zone_id" {
  default = "Z0858131H2G4LTDQGMIX"
}
variable "environment" {
    default = "dev"
  
}

variable "domain_name" {
    default = "saidevops.shop"
  
}

variable "instances" {
    type = map
    default = {
        mongodb ={
            instance_type = "t3.micro"
            port_no = 27017
        }, 
        redis ={
            instance_type = "t3.micro"
            port_no = 6379
        } , 
        mysql ={
                instance_type = "t3.micro"
                port_no = 3306
        }, 
        rabbitmq = {
             instance_type = "t3.micro"
               port_no = 5672
         },
        catalogue ={
             instance_type = "t3.micro"
            port_no = 8080
         },
        user ={
             instance_type = "t3.micro"
            port_no = 8080
         },
        cart ={
             instance_type = "t3.micro"
            port_no = 8080
         }, 
        payment ={
             instance_type = "t3.micro"
            port_no = 8080
         },
        shipping ={
             instance_type = "t3.micro"
            port_no = 8080
         },
        frontend ={
             instance_type = "t3.micro"
            port_no = 80
         }
    }
}

variable "instance_type" {
    default = "t3.micro"

    validation {
        condition = contains(["t3.micro","t3.small","t3.medium","t3.large"],var.instance_type)
        error_message = "instance type must be from one of the values: t3.micro, t3.small, t3.medium, t3.large"
    }
}

variable "project" {
  default = "roboshop"
}

variable "common_tags" {

    default =  {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true" 
    }
}