resource "aws_instance" "web" {
  ami                                  = "ami-03972092c42e8c0ca"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  instance_type                        = "t2.micro"
  ipv6_addresses                       = []
  key_name                             = "module"
  monitoring                           = false
  security_groups                      = ["launch-wizard-1"]
  source_dest_check                    = true
  subnet_id                            = "subnet-032caa22f99ff30e4"
  tags = {
    Name = "webserver"
  }
}
