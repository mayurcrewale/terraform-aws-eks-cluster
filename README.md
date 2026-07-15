# terraform-aws-eks-cluster

EKS control plane in an existing VPC: cluster IAM role, `aws_eks_cluster`
resource, and the IAM OIDC provider required for IRSA.

Defaults to a private-only API endpoint (`endpoint_private_access = true`,
`endpoint_public_access = false`) — see `variables.tf` to change that.

## Usage

```hcl
module "eks_cluster" {
  source = "git::https://example.com/your-org/terraform-aws-eks-cluster.git?ref=v1.0.0"

  cluster_name       = "hello-world-poc"
  kubernetes_version = "1.36"
  vpc_id             = "vpc-xxxxxxxx"
  subnet_ids         = ["subnet-aaaa", "subnet-bbbb"]
}
```

See `outputs.tf` for what it exposes (endpoint, CA data, OIDC provider ARN/URL, etc).
