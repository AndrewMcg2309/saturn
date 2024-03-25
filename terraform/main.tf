resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Portfolio Web Server"
  }
}

resource "tls_private_key" "web_server_pk" {
  algorithm = "RSA"
}
resource "aws_key_pair" "generated_key" {
  key_name   = "<keyname>"
  public_key = tls_private_key.web_server_pk.public_key_openssh

  depends_on = [
    tls_private_key.web_server_pk
  ]
}
resource "local_file" "key" {
  content         = tls_private_key.web_server_pk.private_key_pem
  filename        = "<keyname>.pem"
  file_permission = "0400"

  depends_on = [
    tls_private_key.web_server_pk
  ]
}