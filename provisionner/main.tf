resource "aws_instance" "Server" {
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  key_name      = "module-key"
  depends_on = [ aws_key_pair.ec2_key ]
}

resource "null_resource" "n1" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(local_file.ssh_key.filename)
    host        = aws_instance.Server.public_ip
  }

  provisioner "local-exec" {
    command = "echo hello"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo useradd Poly",
      "mkdir terraform"
    ]
  }

  provisioner "file" {
    source      = "module-key.pem"
    destination = "/tmp/key.pem"
  }

  depends_on = [aws_instance.Server]
}