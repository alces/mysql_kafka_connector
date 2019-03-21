variable "aws_region" {
  default = "eu-west-1"
}

variable "ip_addr" {
  default = "10.0.14.31"
}

variable "mysql_ami" {
  # CentOS 7 in eu-west-1
  default = "ami-3b261642"
}

variable "mysql_disk_size" {
  default = 10
}

variable "mysql_instance_type" {
  default = "m5.large"
}

variable "security_groups" {
  default = [
    "sg-057e66c1c80ae762e",
    "sg-02863311c6ce41847",
    "sg-0ae70a4dc60c7afe5"
  ]
}

variable "project_name" {
    default = "Security PoC"
}

variable "ssh_key_pair" {
  default = "azalesny"
}

variable "subnet_id" {
  default = "subnet-02045665e7ed3e0ae"
}