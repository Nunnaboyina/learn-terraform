resource "aws_security_group" "dynamic-demo" {

    name = "roboshop-dynamic"
    description = "SG for roboshop-dynamic"

dynamic "ingress" {
    for_each = var.ingress_values
    content {
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = "tcp"
        cidr_blocks = ingress.value.cidr_blocks
        }
       
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
      Name = "roboshop-dynamic"
    }
  
}