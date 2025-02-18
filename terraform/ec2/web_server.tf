variable "web_server_name" {
  description = "Name the instance on deploy"
  default     = "web_server"
}

resource "aws_instance" "devops_01_web" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = "my-first-keypair"

  tags = {
    Name = "${var.web_server_name}"
  }
}
