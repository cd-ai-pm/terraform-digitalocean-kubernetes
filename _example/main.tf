module "kubernetes" {
  source = "../"

  name        = "example"
  environment = "test"
  region      = "nyc1"

  # Enable SSO for the cluster
  sso_enabled = true

  # Default node pool
  critical_node_pool = {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 1
    auto_scale = false
  }

  # Additional node pools
  app_node_pools = {
    worker = {
      name       = "worker"
      size       = "s-2vcpu-4gb"
      node_count = 2
      auto_scale = false
    }
  }
}