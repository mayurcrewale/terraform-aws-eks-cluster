# terraform-aws-eks-cluster

EKS control plane in an existing VPC: cluster IAM role, `aws_eks_cluster`
resource, and the IAM OIDC provider required for IRSA.

Defaults to a private-only API endpoint (`endpoint_private_access = true`,
`endpoint_public_access = false`) — see `variables.tf` to change that.

## Usage

```hcl
module "eks_cluster" {
  source = "git::https://github.com/mayurcrewale/terraform-aws-eks-cluster.git?ref=v1.0.0"

  cluster_name       = "hello-world-poc"
  kubernetes_version = "1.36"
  vpc_id             = "vpc-xxxxxxxx"
  subnet_ids         = ["subnet-aaaa", "subnet-bbbb"]
}
```

See `outputs.tf` for what it exposes (endpoint, CA data, OIDC provider ARN/URL, etc).

## CI / Releasing

[`.github/workflows/terraform-ci.yml`](.github/workflows/terraform-ci.yml)
runs `terraform fmt -check` + `terraform init` + `terraform validate` on
every push to `main` and every pull request.

To cut a new release tag: **Actions** tab → **Terraform CI** → **Run
workflow** → pick `patch`/`minor`/`major` from the `bump` dropdown (leave as
`none` for a validate-only run). It reads the latest `vX.Y.Z` tag, bumps it,
and pushes the new tag — using the workflow's built-in `GITHUB_TOKEN`, no
extra credentials to set up. Consumers pin to that tag via `?ref=vX.Y.Z` in
their `source` — see **Usage** above.
