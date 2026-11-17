resource "aws_instance" "roboshop_workspaces" {
  ami = data.aws_ami.joindevops.id
  instance_type = lookup(var.instance_type,terraform.workspace)
  vpc_security_group_ids = [aws_security_group.roboshop_workspaces.id]

  tags = var.ec2-tags
}

resource "aws_security_group" "roboshop_workspaces" {
  name        = "roboshop_workspaces-${terraform.workspace}"
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
    Name = "roboshop_workspaces"
  }

  lifecycle {
    create_before_destroy = true
  }
}

