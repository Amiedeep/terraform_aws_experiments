
data "http" "workstation-external-ip" {
  url   = "http://ipv4.icanhazip.com"
}

locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}

resource "aws_security_group" "security_group" {
  name   = "${var.instance_name} group"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.instance_name} sg"
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [local.workstation-external-cidr]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = [local.workstation-external-cidr]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

