module "vpc" {
  source       = "../../resources/vpc"
  primary_cidr = "172.20.0.0/16"
}

module "eks" {
  source            = "../../resources/eks"
  public_subnets  = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  aws_cluster_name = var.aws_cluster_name
}

