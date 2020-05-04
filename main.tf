terraform {
  required_version = ">= 0.12.24"
  backend "s3" { }
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr_block          = var.vpc_cidr_block
  availability_zones      = var.availability_zones
  resource_prefix         = var.resource_prefix
  tags                    = var.tags
}


