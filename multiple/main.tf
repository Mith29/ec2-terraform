provider "aws" {
  region     = "us-east-1"
  access_key = "xxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxx"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "10am"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
