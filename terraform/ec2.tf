resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
  subnet_id              = aws_subnet.public.id

  tags = {
    Name = "Portfolio Web Server"
  }
}

resource "tls_private_key" "web_server_pk" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "web_server_pk"
  public_key = tls_private_key.web_server_pk.public_key_openssh

  depends_on = [
    tls_private_key.web_server_pk
  ]
}

resource "local_file" "key" {
  content         = tls_private_key.web_server_pk.private_key_pem
  filename        = "web_server_pk.pem"
  file_permission = "0400"

  depends_on = [
    tls_private_key.web_server_pk
  ]
}