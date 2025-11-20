output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate authority data for the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks.name
}

output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = aws_eks_node_group.workers.arn
}

output "cluster_security_group_id" {
  description = "Security group ID for the EKS control plane"
  value       = aws_security_group.eks_cluster_sg.id
}

output "nodes_security_group_id" {
  description = "Security group ID for EKS worker nodes (created by module)"
  value       = aws_security_group.eks_nodes_sg.id
}

output "eks_autoscaler_policy_arn" {
  description = "ARN of the created EKS autoscaler IAM policy"
  value       = aws_iam_policy.eks_autoscaler_policy.arn
}
