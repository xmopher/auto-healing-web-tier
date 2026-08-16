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

output "alb_dns_name" {
  description = "Public DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "Target group ARN for the ASG"
  value       = module.alb.target_group_arn
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = module.asg.asg_name
}
