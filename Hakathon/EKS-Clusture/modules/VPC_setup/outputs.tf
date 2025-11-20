output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets (ordered)"
  value       = [module.public_subnet_0.subnet_id, module.public_subnet_1.subnet_id]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets (ordered)"
  value       = [module.private_subnet_0.subnet_id, module.private_subnet_1.subnet_id]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = module.nat_gateway.nat_gateway_id
}
