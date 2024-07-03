module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                  = "Jenkins-Server"
  instance_type         = var.instance_type
  key_name              = "devops.pub"
  monitoring            = true
  vpc_security_group_ids = [module.jenkins_sg.security_group_id]
  subnet_id             = module.vpc.public_subnets[0]
  user_data             = file("jenkins.sh")  
  associate_public_ip_address = true
  availability_zone = data.aws_availability_zones.azs.names[0]

  tags = {
    Name        = "Jenkins-Server"
    Terraform   = "true"
    Environment = "dev"
  }
}
