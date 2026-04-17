module "kubernetes" {
  source = "../"

  name        = "example"
  environment = "test"
  region      = "nyc1"

  sso_enabled = true

  critical_node_pool = {
    name       = "critical"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}