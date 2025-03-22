provider "aws" {
  region = var.region
}

module "ec2_s3" {
  source = "./modules/ec2_s3"

  environment    = terraform.workspace
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_count = var.instance_count
  subnet_id      = var.subnet_id
  region         = var.region
}
