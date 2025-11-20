output "vpc_id" {
    description = "The ID of the created VPC"
    value       = module.vpc_set.vpc_id
}
output "public_subnet_ids" {
    description = "The IDs of the created public subnets"
    value       = module.vpc_set.public_subnet_ids
}
output "private_subnet_ids" {
    description = "The IDs of the created private subnets"
    value       = module.vpc_set.private_subnet_ids
}
output "internet_gateway_id" {
    description = "The ID of the created internet gateway"
    value       = module.vpc_set.internet_gateway_id
}
output "aws_eip_id" {
    description = "The ID of the created Elastic IP for the NAT gateway"
    value       = module.vpc_set.nat_gateway_id
}
output "nat_gateway_id" {
    description = "The ID of the created NAT gateway"
    value       = module.vpc_set.nat_gateway_id
}