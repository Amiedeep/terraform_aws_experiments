module "vpc" {
  source       = "../../resources/vpc"
  primary_cidr = "172.20.0.0/16"
}

module "ec2" {
  source            = "../../resources/ec2"
  public_subnet_id  = module.vpc.public_subnet_ids.0
  vpc_id            = module.vpc.vpc_id
  instance_name = var.instance_name
}

