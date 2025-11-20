module "vpc" {
  source         = "../VPC"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.tags
}

module "public_subnet_0" {
  source            = "../Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags              = var.tags
}

module "private_subnet_0" {
  source            = "../Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags              = var.tags
}

module "public_subnet_1" {
  source            = "../Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags              = var.tags
}

module "private_subnet_1" {
  source            = "../Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags              = var.tags
}

module "internet_gateway" {
  source = "../Internet_Gateway"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

resource "aws_eip" "nat_eip" {
  tags = var.tags
}

module "nat_gateway" {
  source        = "../NAT_Gateway"
  subnet_id     = module.public_subnet_0.subnet_id
  allocation_id = aws_eip.nat_eip.id
  tags          = var.tags
}

module "route_table_public" {
  source = "../Route_Table"
  create_igw_route    = true
  create_nat_route    = false
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  vpc_id = module.vpc.vpc_id
  tags = var.tags
}

resource "aws_route_table_association" "public_subnet_0" {
  subnet_id      = module.public_subnet_0.subnet_id
  route_table_id = module.route_table_public.route_table_id
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = module.public_subnet_1.subnet_id
  route_table_id = module.route_table_public.route_table_id
}

module "route_table_private" {
  source = "../Route_Table"
  create_igw_route    = false
  create_nat_route    = true
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  vpc_id = module.vpc.vpc_id
  tags = var.tags
}

resource "aws_route_table_association" "private_subnet_0" {
  subnet_id      = module.private_subnet_0.subnet_id
  route_table_id = module.route_table_private.route_table_id
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = module.private_subnet_1.subnet_id
  route_table_id = module.route_table_private.route_table_id
}
