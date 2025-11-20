# -----------------------------------------------------------
# Network (VPC set)
# -----------------------------------------------------------
module "vpc_setup" {
  source = "./modules/VPC_set"

  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.4.0/24"]
  availability_zones   = ["ap-south-1a", "ap-south-1b"]
  tags = {
    Name        = "MyVPC"
    Environment = "terraform"
    Owner       = "MyTeam"
  }
}

# -----------------------------------------------------------
# EKS module
# -----------------------------------------------------------
module "eks" {

  source = "./modules/EKS"

  vpc_id              = module.vpc_set.vpc_id
  private_subnet_ids  = module.vpc_set.private_subnet_ids

  # Optional overrides (defaults are set in module)
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  instance_type   = var.instance_type
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  tags             = var.tags
}

