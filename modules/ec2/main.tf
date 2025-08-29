# Security group allowing HTTP and all egress
resource "aws_security_group" "http_sg" {
  name   = "http-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_sg.id
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_sg.id
}

resource "aws_instance" "public" {
  count                       = 3
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = element(var.public_subnets, count.index)
  vpc_security_group_ids      = [aws_security_group.http_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "public-instance-${count.index + 1}"
  }
}

resource "aws_instance" "private" {
  count                  = 3
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnets, count.index)
  vpc_security_group_ids = [aws_security_group.http_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "private-instance-${count.index + 1}"
  }
}