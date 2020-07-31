variable "vpc_id" {
}

variable "public_subnets" {
}

variable "eks_nodes" {
  description = "EKS Kubernetes worker nodes, desired ASG capacity (e.g. `2`)"
  default     = 2
  type        = number
}

variable "eks_min_nodes" {
  description = "EKS Kubernetes worker nodes, minimal ASG capacity (e.g. `1`)"
  default     = 1
  type        = number
}

variable "eks_max_nodes" {
  description = "EKS Kubernetes worker nodes, maximal ASG capacity (e.g. `3`)"
  default     = 3
  type        = number
}

variable "aws_cluster_name" {
  description = "AWS ELS cluster name (e.g. `k8s-eks`)"
  type        = string
  default     = "k8s-eks"
}

variable "aws_instance_type" {
  description = "AWS EC2 Instance Type (e.g. `t3.medium`)"
  type        = string
  default     = "t3.micro"
}

variable "key_path" {
  description = "ssh key path"
  type        = string
  default     = "/Users/amandeep/git_projects/Ansible-terraform/ci_key.pub"
}