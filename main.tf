terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6"
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
  admin_cidr           = var.admin_cidr
}

module "compute" {
  source = "./modules/compute"

  ami_id            = var.ami_id
  key_name          = var.key_name
  web_count         = var.web_count
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  web_sg_id         = module.network.web_sg_id
  db_sg_id          = module.network.db_sg_id
}
