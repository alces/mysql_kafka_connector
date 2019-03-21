provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "mysql_instance" {
  ami = "${var.mysql_ami}"
  instance_type = "${var.mysql_instance_type}"
  key_name = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${var.security_groups}"]
  subnet_id = "${var.subnet_id}"
  private_ip = "${var.ip_addr}"
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "ansible-playbook -b -i ${var.ip_addr}, -u centos -v playbooks/mysql.yml"
  }

  root_block_device {
    volume_size = "${var.mysql_disk_size}"
  }
 
  tags {
    Name = "mysql-ssl01"
    Project = "${var.project_name}"
  }

}