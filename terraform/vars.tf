variable "region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-00c90dbdc12232b58"
}

variable "availability_zones" {
  type    = string
  default = "eu-west-1a"
}

# Required to be specified in tfvars
variable "cidr_block" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "env" {}