variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for subnets (order matches CIDR lists)"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "tags" {
  description = "Tags to apply to all created resources"
  type        = map(string)
  default     = {}
}
