provider "aws" {
  region     = "us-east-2"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-07d7e3e669718ab45"
  instance_type          = "t2.micro"
  key_name               = "test"
  monitoring             = true
  vpc_security_group_ids = ["sg-004d3810e5e0fa036"]
  subnet_id              = "subnet-0599def636219b4bb"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
