provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "redhat_instance" {
  ami = "${var.mysql_ami}"
  instance_type = "${var.mysql_instance_type}"
  key_name = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${var.security_groups}"]
  subnet_id = "${var.subnet_id}"
  private_ip = "${var.ip_addr}"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    connection {
      host = "${var.ip_addr}"
      private_key = "${file("/Users/azalesny/.ssh/id_rsa")}"
      user = "ec2-user"
    }
    script = "build-patroni.sh"
  }

  root_block_device {
    volume_size = "${var.mysql_disk_size}"
  }
 
  tags {
    Name = "patroni-ssl01"
    Project = "${var.project_name}"
  }

}
