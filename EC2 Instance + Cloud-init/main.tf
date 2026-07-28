resource "aws_security_group" "web" {

  name = "cloud-init-web"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["176.251.185.72/32"] 
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {

  ami           = "ami-01029182857b20417"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  user_data = file("${path.module}/cloud-init.yaml")

  tags = {
    Name = "Terraform-CloudInit"
  }
}
