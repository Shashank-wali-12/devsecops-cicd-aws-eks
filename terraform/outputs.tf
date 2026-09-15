output "vpc_id" {
  description = "ID of the EKS VPC"
  value       = aws_vpc.eks.id
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS Kubernetes API endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_security_group_id" {
  description = "Security group ID associated with the EKS cluster"
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "eks_node_group_name" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.eks.node_group_name
}
