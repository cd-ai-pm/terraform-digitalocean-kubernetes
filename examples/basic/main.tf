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

module "terraform_digitalocean_kubernetes" {
  source = "../.."

  name = "terraform-digitalocean-kubernetes-basic"
}
