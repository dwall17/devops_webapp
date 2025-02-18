variable "web_server_name" {
  description = "Name the instance on deploy"
  default     = "web_server"
}

resource "aws_instance" "devops_01_web" {
  ami           = "ami-053a45fff0a704a47"
  instance_type = "t2.micro"
  key_name      = "my-first-keypair"

  tags = {
    Name = "${var.web_server_name}"
  }
}
