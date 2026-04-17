module "example" {
  source = "../"

  name        = "example"
  environment = "test"
  region      = "nyc1"

  sso_enabled = true

  critical_node_pool = {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 2
    auto_scale = false
  }

  app_node_pools = {
    worker = {
      name       = "worker"
      size       = "s-2vcpu-4gb"
      node_count = 1
      auto_scale = true
      min_nodes  = 1
      max_nodes  = 3
    }
  }

  tags = ["example", "test"]
}