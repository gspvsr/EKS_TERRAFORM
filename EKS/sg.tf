
module "eks_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "eks_sg"
  description = "Security group for Jenkins server and SSH to open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      description = "Allowing All"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "allowing Jenkins"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}
