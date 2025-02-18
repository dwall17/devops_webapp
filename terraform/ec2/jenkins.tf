variable "jenkins_name" {
  description = "Name the instance on deploy"
  default     = "jenkins"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH inbound traffic"

  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (this is common for security groups)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_instance" "devops_01_jenkins" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = "my-first-keypair"

  # Attach the security group created above
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "${var.jenkins_name}"
  }
}
