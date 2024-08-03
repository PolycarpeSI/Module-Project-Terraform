data "aws_instance" "ec21" {
  instance_id = "i-0c6c09045475537fa"
}


data "aws_ami" "ami1" {
  //executable_users = ["self"] 
  most_recent      = true
  //name_regex       = "^myami-\\d{3}"
  owners           = ["amazon"] // This is say we want the ami from Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}