resource "aws_iam_group" "gp1" {
  name = "manager"
 lifecycle {
    //prevent_destroy = true // to avoid destroying the resource
    prevent_destroy = false // to allow destroying the resource
  }
}

resource "aws_iam_user" "usr1" {
  name = "poly2024"
  depends_on = [ aws_iam_group.gp1 ] // the user will going to create after the group
}

resource "aws_instance" "server1" {
  ami = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  key_name = "module"
  lifecycle {
    create_before_destroy = true // This is use to create the resource before destroying it in the case of modification. 
  }
}