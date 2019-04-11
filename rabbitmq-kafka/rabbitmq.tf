provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "rabbitmq_instance" {
  ami = "${var.mysql_ami}"
  instance_type = "${var.mysql_instance_type}"
  key_name = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${concat(var.security_groups, list(aws_security_group.allow_rabbitmq.id))}"]
  subnet_id = "${var.subnet_id}"
  private_ip = "${var.ip_addr}"
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "ansible-playbook -b -i ${var.ip_addr}, -u centos -v playbooks/rabbitmq.yml"
  }

  root_block_device {
    volume_size = "${var.mysql_disk_size}"
  }
 
  tags {
    Name = "rabbitmq-ssl01"
    Project = "${var.project_name}"
  }

}

resource "aws_security_group" "allow_rabbitmq" {
    name = "allow_rabbitmq"
    description = "Allow RabbitMQ from another envs"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 5672
        to_port = 5672
        protocol = "6"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Project = "${var.project_name}"
    }
}
