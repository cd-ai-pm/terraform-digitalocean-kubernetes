module "kubernetes" {
  source = "../"

  name        = "example-cluster"
  environment = "dev"
  region      = "nyc1"

  cluster_version = "1.31.1-do.5"
  sso_enabled     = true  # Example usage of the new variable

  critical_node_pool = {
    name       = "default"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 2
  }

  app_node_pools = {
    worker = {
      name       = "worker"
      size       = "s-2vcpu-4gb"
      auto_scale = true
      min_nodes  = 1
      max_nodes  = 3
    }
  }
}