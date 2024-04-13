## custom variables

region          = "eu-west-1"
instance_type   = "t3.micro"              # ec2 instance
ami_id          = "ami-00c90dbdc12232b58" # 22.04-amd64
cidr_block      = "10.23.0.0/16"          # vpc cidr
public_subnets  = "10.23.1.0/24"
private_subnets = "10.23.0.0/24"
env             = "andrew-web"