module "kubernetes" {
  source = "../"

  name        = "example-cluster"
  environment = "prod"
  region      = "nyc1"
  sso_enabled = true

  critical_node_pool = {
    name       = "critical"
    size       = "s-2vcpu-4gb"
    node_count = 1
  }

  app_node_pools = {
    app = {
      name       = "app"
      size       = "s-2vcpu-4gb"
      node_count = 2
    }
  }
}
