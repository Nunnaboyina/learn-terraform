resource "aws_instance" "functions" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.functions.id
        
    ]

    tags = merge(
            var.common_tags,
        {
        Name = "${var.project}-functions"
        component = "poc"
    })
}

resource "aws_security_group" "functions" {

    name = "${var.project}-functions"
    description = "SG for roboshop "
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]

    }

    tags = merge(var.common_tags,
    {
      Name = "${var.project}-functions-sg"
    }
    )

}