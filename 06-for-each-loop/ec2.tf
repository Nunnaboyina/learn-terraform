resource "aws_instance" "roboshop"{
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value.instance_type
    vpc_security_group_ids = [
        aws_security_group.roboshop[each.key].id,
         #aws_security_group.roboshop["mongodb"] 
        aws_security_group.common.id
            ]
    tags = merge(
      var.common_tags,
      {
        Name = "${var.project}-${var.environment}-${each.key}"
      }
    )

}

resource "aws_security_group" "common" {
    name = "${var.project}-${var.environment}-common"
    description = "common SG for all the instances"
   
       egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}-common"
        }
    )
}


resource "aws_security_group" "roboshop" {
    for_each = var.instances
    name = "${var.project}-${var.environment}-${each.key}"
    description = "SG for all the instances"
    ingress {
        from_port = each.value.port_no
        to_port = each.value.port_no
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}-${each.key}"
        }
    )
}