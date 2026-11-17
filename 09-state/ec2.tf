resource "aws_instance" "roboshop_state" {
    ami = data.aws_ami.joindevops.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_state.id, aws_security_group.roboshop_state-2.id]

  tags = var.ec2-tags
}

resource "aws_security_group" "roboshop_state" {
  name        = "roboshop_state"
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
    Name = "roboshop-state"
  }
}

resource "aws_security_group" "roboshop_state-2" {
  name        = "roboshop_state-2demo"
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
    Name = "roboshop-state-2"
  }

  lifecycle {
    create_before_destroy = true
  }
}

