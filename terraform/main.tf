provider "aws" {
  region = "us-west-1"
}


resource "aws_instance" "web-server-instance"{
  ami           = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
  key_name      = "project"
  tags = {
    name = "webserver"
  }
}