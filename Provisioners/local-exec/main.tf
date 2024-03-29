resource "aws_instance" "local-exec-ec2" {
    ami = "ami-0f3c7d07486cad139"
    instance_type = "t2.micro"

    tags = {
    Name = "provisiones-local-exec-ec2"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory.txt"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i inventory web.yaml"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'"
  }
}