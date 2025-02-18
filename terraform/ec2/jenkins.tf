
provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "Name the instance on deploy"
  default     = "jenkins"
}

resource "aws_instance" "devops_01_jenkins" {
  ami           = "ami-053a45fff0a704a47"
  instance_type = "t2.micro"
  key_name      = "my-first-keypair"

  tags = {
    Name = "${var.name}"
  }
}
