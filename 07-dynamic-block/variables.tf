variable "ingress_values" {

    default = {
        ssh = {
            port  = 22
            description = "Opening port 22 to all IPs for SSH access"
            cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
            port = 80
            description = "Opening port 80 to all IPs for SSH access"
            cidr_blocks = ["0.0.0.0/0"]
        }
        mysql = {
            port = 3306
            description = "Opening port 3306 to all IPs for SSH access"
            cidr_blocks = ["0.0.0.0/0"]
        }
        tcp = {
            port  = 8081
            description = "Opening port 8081 to all IPs for SSH access"
            cidr_blocks = ["0.0.0.0/0"]
        }

    }
  
}