module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Jenkins_VPC"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  public_subnets = var.public_subnets
  enable_dns_hostnames = true

  tags = {
    Name = "Jenkin_VPC"
    Terraform = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "Jenkins_Public_Subnet"
  }


  public_route_table_tags = {
    Name = "Jenkins_Public_Subnet_RT"
  }
}

