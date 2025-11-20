variable "vpc_id" {
  description = "VPC id where EKS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet ids for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
  default     = "worker-group-1"
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Max size for worker node group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Min size for worker node group"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
