module "kubernetes" {
  source = "../"

  name        = "example"
  environment = "test"
  region      = "nyc1"

  cluster_version = "1.31.1-do.5"
  sso_enabled     = true

  critical_node_pool = {
    name       = "critical"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 2
  }

  app_node_pools = {
    app = {
      name       = "app"
      size       = "s-2vcpu-4gb"
      auto_scale = true
      min_nodes  = 1
      max_nodes  = 3
    }
  }
}
