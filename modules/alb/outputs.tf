output "alb_arn" {
  description = "ARN of the application load balancer"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "ARN of the HTTP target group"
  value       = aws_lb_target_group.http.arn
}
