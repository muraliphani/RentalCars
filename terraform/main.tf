provider "aws" {
  region = "us-west-1"
}


resource "aws_instance" "web-server-instance"{
  ami           = "ami-085284d24fe829cd0"
  instance_type = "t2.micro"
  key_name      = "project"
  tags = {
    name = "webserver"
  }
}