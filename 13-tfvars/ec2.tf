resource "aws_instance" "roboshop_tfvars" {
  ami = data.aws_ami.joindevops.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_tfvars.id]

  tags = merge(var.ec2-tags,
        {
          Name = "roboshop-tfvars-${var.environment}"
        } )
}

resource "aws_security_group" "roboshop_tfvars" {
  name        = "roboshop_tfvars_${var.environment}"
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
    Name = "roboshop_tfvars_${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

