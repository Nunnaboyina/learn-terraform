resource "aws_instance" "mongodb" {
    ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mongodb.id]

  tags = var.ec2-tags
}

resource "aws_security_group" "mongodb" {
  name        = "mongodb"
  description = "Allow TLS inbound traffic and all outbound traffic"

     ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }


     egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

  tags = {
    Name = "roboshop-mongodb"
  }
}
