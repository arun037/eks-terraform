module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.28.0"

  cluster_name = var.cluster_peru
  cluster_version = var.cluster_vers
  cluster_endpoint_public_access = true

  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type        = "AL2_x86_64"
    instance_type   = ["t2.small"]

  }

  eks_managed_node_groups = {
    node_group = {
        min_size     = 2
        max_size     = 3
        desired_size = 2
    }

  }




}
