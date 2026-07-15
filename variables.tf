variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version, e.g. 1.36."
  type        = string
  default     = "1.36"
}

variable "vpc_id" {
  description = "Existing VPC ID the cluster control plane ENIs will be attached to."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS control plane (private subnets across >= 2 AZs recommended)."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "Provide at least two subnets in different AZs for the EKS control plane."
  }
}

variable "endpoint_private_access" {
  description = "Enable private API server endpoint access."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public API server endpoint access. Set false for a fully private endpoint."
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to reach the public API endpoint, only relevant if endpoint_public_access is true."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enabled_cluster_log_types" {
  description = "Control plane log types to enable in CloudWatch."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "additional_security_group_ids" {
  description = "Additional security group IDs to attach to the cluster ENIs, in addition to the cluster-managed one."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to all resources created by this module."
  type        = map(string)
  default     = {}
}
