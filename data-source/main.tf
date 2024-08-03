resource "aws_instance" "Demo" {
  instance_type = data.aws_instance.ec21.instance_type
  //ami = data.aws_instance.ec21.ami
  ami = data.aws_ami.ami1.id
  key_name = data.aws_instance.ec21.key_name
}