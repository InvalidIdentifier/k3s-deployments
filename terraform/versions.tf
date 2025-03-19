terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }

  }

  backend "local" {
    path = "/tmp/state/k3s_deployment_state.tfstate"
  }
  required_version = ">= 0.13"
}
