variable "aws_region" {
  default = "eu-west-1"
}

variable "mysql_ami" {
  # CentOS 7 in eu-west-1
  default = "ami-3b261642"
}

variable "mysql_disk_size" {
  default = 20
}

variable "mysql_instance_type" {
  default = "m5.large"
}

variable "security_groups" {
  default = [
    "sg-057e66c1c80ae762e",
    "sg-02863311c6ce41847",
    "sg-00a12525eb84b3632"
  ]
}

variable "project_name" {
    default = "Multi-DC PoC"
}

variable "ssh_key_pair" {
  default = "azalesny"
}

variable "subnets" {
  default = [
    {
      id = "subnet-06cef1a4ee0bc2098",
      addr = "10.0.11.30",
      zone = "eu-west-1a"
    },
    {
      id = "subnet-01cdbe652fbde5c4a",
      addr = "10.0.12.30",
      zone = "eu-west-1b"
    }
  ]
}