variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for web instances"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN to register instances with"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the web tier"
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  description = "Desired number of instances (N+1 requires at least 2)"
  type        = number
  default     = 2

  validation {
    condition     = var.desired_capacity >= 2
    error_message = "Desired capacity must be at least 2 for N+1 capacity."
  }
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 2

  validation {
    condition     = var.min_size >= 2
    error_message = "Minimum size must be at least 2 for N+1 capacity."
  }
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 4
}

variable "docker_image" {
  description = "Container image to run on each instance (Docker Hub or your registry)"
  type        = string
  default     = "nginx:alpine"
}
