resource "aws_instance" "local-exec-ec2" {
    ami = "ami-0f3c7d07486cad139"
    instance_type = "t2.micro"

    tags = {
    Name = "provisiones-remote-exec-ec2"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory.txt"
  }

    provisioner "local-exec" {
    command = "ansible-playbook -i inventory web.yaml"
    on_failure = continue
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'this is remote-exec' > /tmp/remote.txt",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo yum install ansible -y",

    ]
  }

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }
}