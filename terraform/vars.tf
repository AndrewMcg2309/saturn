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

variable "hosted_zone" {
  type    = string
  default = "Z0165134WM6CF9U4IRGK"
}

variable "ssl_certificate" {
  type    = string
  default = "arn:aws:acm:eu-west-1:098869234658:certificate/d5a85c26-610c-4fcc-ae19-15759a31c3cc" #andrewmcgowan.ie
}

# Required to be specified in tfvars

variable "alb_subnets" {
  type = list(any)
}
variable "cidr_block" {
  type = string
}
variable "public_subnets" {
  type = string
}
variable "private_subnets" {
  type = string
}
variable "env" {
  type = string
}