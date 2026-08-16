locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "terraform"
  }
}

module "network" {
  source = "./modules/network"

  name_prefix = local.name_prefix
  vpc_cidr    = var.vpc_cidr
  az_count    = 2
}

module "alb" {
  source = "./modules/alb"

  name_prefix       = local.name_prefix
  vpc_id            = module.network.vpc_id
  subnet_ids        = module.network.public_subnet_ids
  security_group_id = module.network.alb_security_group_id
}

module "asg" {
  source = "./modules/asg"

  name_prefix       = local.name_prefix
  subnet_ids        = module.network.public_subnet_ids
  security_group_id = module.network.instance_security_group_id
  target_group_arn  = module.alb.target_group_arn
  instance_type     = var.instance_type
  desired_capacity  = var.desired_capacity
  min_size          = var.min_size
  max_size          = var.max_size
  docker_image      = var.docker_image
}
