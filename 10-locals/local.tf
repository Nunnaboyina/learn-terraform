locals {
  instance_type="t3.micro"
  Name = "${var.project}-${var.Environment}"
  common_tags={
    Project = var.project
    Environment = var.Environment
    Terraform = "true"
  }
  ec2_tags = merge(
    local.common_tags,
    {
      Name = "${local.Name}-locals-demo"
    }
  )
   
}