output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_arn" {
  value = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_version" {
  value = aws_eks_cluster.this.version
}

output "cluster_security_group_id" {
  description = "The cluster-managed security group ID created by EKS itself (aws_eks_cluster.vpc_config[0].cluster_security_group_id)."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "additional_security_group_id" {
  value = aws_security_group.cluster.id
}

output "cluster_iam_role_arn" {
  value = aws_iam_role.cluster.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.cluster.arn
}

output "oidc_provider_url" {
  value = replace(aws_iam_openid_connect_provider.cluster.url, "https://", "")
}
