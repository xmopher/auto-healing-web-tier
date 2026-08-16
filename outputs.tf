output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = module.network.alb_security_group_id
}

output "instance_security_group_id" {
  description = "Instance security group ID"
  value       = module.network.instance_security_group_id
}
