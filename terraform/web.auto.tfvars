## custom variables

region          = "eu-west-1"
instance_type   = "t3.micro"              # ec2 instance
ami_id          = "ami-00c90dbdc12232b58" # 22.04-amd64
cidr_block      = "10.23.0.0/16"          # vpc cidr
public_subnets  = "10.23.10.0/24"
private_subnets = "10.23.20.0/24"
alb_subnets     = ["10.23.112.0/20", "10.23.64.0/20"]
env             = "andrew-web"
hosted_zone     = "Z0165134WM6CF9U4IRGK"