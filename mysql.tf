provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "mysql_instance" {
  count = 2
  ami = "${var.mysql_ami}"
  instance_type = "${var.mysql_instance_type}"
  key_name = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${var.security_groups}"]
  subnet_id = "${lookup(var.subnets[count.index], "id")}"
  private_ip = "${lookup(var.subnets[count.index], "addr")}"
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "ansible-playbook -b -i ${lookup(var.subnets[count.index], "addr")}, -u centos -v playbooks/mysql.yml"
  }

  root_block_device {
    volume_size = "${var.mysql_disk_size}"
  }
 
  tags {
    Name = "mysql-${lookup(var.subnets[count.index], "zone")}"
    Project = "${var.project_name}"
  }

}