provider "aws" {
  region     = "us-east-2"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-07d7e3e669718ab45"
  instance_type          = "t2.micro"
  key_name               = "test"
  monitoring             = true
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
