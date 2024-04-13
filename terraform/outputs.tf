output "aws_region" {
  value = var.region
}
output "env_name" {
  value = var.env
}
output "availability_zones" {
  value = var.availability_zones
}
output "web_private_key" {
  value     = tls_private_key.web_private_key.private_key_pem
  sensitive = true
}