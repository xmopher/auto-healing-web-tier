# Architecture

## Logical diagram

```mermaid
flowchart TB
  users[Internet users] --> igw[Internet Gateway]
  igw --> alb[ALB<br/>public subnets<br/>SG: :80 from 0.0.0.0/0]

  alb --> tg[Target Group<br/>protocol HTTP :80<br/>health check GET /]

  tg --> ec2a[ASG instance AZ-a<br/>SG: :80 from ALB SG only]
  tg --> ec2b[ASG instance AZ-b<br/>SG: :80 from ALB SG only]

  userdata[user-data<br/>install Docker<br/>docker run nginx] --> ec2a
  userdata --> ec2b

  asg[Auto Scaling Group<br/>min=2 desired=2 max=4<br/>ELB health checks] -.launch/replace.-> ec2a
  asg -.launch/replace.-> ec2b
```

## Network sketch

```text
VPC 10.0.0.0/16
├── public subnet AZ-a  10.0.0.0/24
├── public subnet AZ-b  10.0.1.0/24
├── IGW + public route  0.0.0.0/0
├── SG alb              ingress 80/tcp world
└── SG instance         ingress 80/tcp from SG alb
```

## Module map

```text
root
├── module.network  → vpc_id, subnet_ids, sg ids
├── module.alb      → alb_dns_name, target_group_arn
└── module.asg      → asg_name (registers into target group)
```

You can paste the Mermaid blocks into [draw.io](https://app.diagrams.net/) (Arrange → Insert → Advanced → Mermaid) if a `.drawio` file is preferred for submission.
