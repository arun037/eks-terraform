module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "~> 5.0"

    name               = var.vpc_name
    cidr               = var.cidr_value
    azs                = local.azs
    public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
    enable_nat_gateway = true
    single_nat_gateway = true

    public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

    private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
  
}