variable "aws_region" {
  default = "eu-west-1"
}

variable "ip_addr" {
  default = "10.0.14.41"
}

variable "ad_ami" {
  # CentOS 7 in eu-west-1
  default = "ami-3b261642"
}

variable "ad_disk_size" {
  default = 8
}

variable "ad_instance_type" {
  default = "t2.small"
}

variable "security_groups" {
  default = [
    "sg-057e66c1c80ae762e",
    "sg-02863311c6ce41847"
  ]
}

variable "project_name" {
    default = "Security PoC"
}

variable "ssh_key_pair" {
  default = "azalesny"
}

variable "subnet_id" {
  default = "subnet-0329494d3085c557e"
}

variable "vpc_id" {
  default = "vpc-04689dd278ff0eb46"
}
