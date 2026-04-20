terraform {
  required_version = ">= 1.5"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.70.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.3"
    }
  }
}

module "vpc" {
  source = "git::https://github.com/cd-ai-pm/terraform-digitalocean-vpc.git?ref=master"

  name = "terraform-digitalocean-kubernetes-complete-vpc"
}

module "terraform_digitalocean_kubernetes" {
  source = "../.."

  vpc_uuid           = module.vpc.id
  app_node_pools     = {}
  auto_upgrade       = true
  cluster_version    = "1.29.7-do.0"
  critical_node_pool = {
    size = "s-2vcpu-4gb"
    count = 2
    labels = {
      app = "critical"
    }
  }
  enabled            = true
  environment        = "production"
  tags               = ["Example=complete", "Environment=test"]
  name               = "complete-cluster"
  region             = "nyc1"
  registry_integration = true
}
