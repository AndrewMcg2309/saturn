variable "region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-00c90dbdc12232b58"
}

variable "cidr_block" {}
variable "env" {}