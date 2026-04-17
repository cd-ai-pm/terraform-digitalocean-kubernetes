module "kubernetes" {
  source = "../"

  name        = "example-cluster"
  environment = "dev"
  region      = "nyc1"
  
  # Enable SSO for the cluster
  sso_enabled = true
  
  critical_node_pool = {
    "default" = {
      size       = "s-1vcpu-2gb"
      node_count = 1
      auto_scale = false
    }
  }
}

output "cluster_id" {
  value = module.kubernetes.cluster_id
}
