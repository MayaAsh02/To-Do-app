terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10"
    }
    argocd = {
      source = "oboukili/argocd"
      version = ">= 6"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 0.14.0"
    }

  }
}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.eks[0].cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks[0].cluster_certificate_authority_data) 
  token                  = try(data.aws_eks_cluster_auth.cluster[0].token, "")
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = try(data.aws_eks_cluster_auth.cluster.token)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        data.aws_eks_cluster.cluster.name,
      ]
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = "${var.project_name}-${var.environment}-eks"
  depends_on = [module.eks.cluster_name]
}

data "aws_eks_cluster_auth" "cluster" {
  name = "${var.project_name}-${var.environment}-eks"
  depends_on = [module.eks.cluster_name]
}
