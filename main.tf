locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "terraform"
  }
}

# Root wiring for modules will be added in later commits:
# - module "network"
# - module "alb"
# - module "asg"
