module "kubernetes" {
  source = "../"

  name        = "example"
  environment = "test"
  region      = "nyc1"

  critical_node_pool = {
    "default" = {
      size      = "s-1vcpu-2gb"
      node_count = 1
    }
  }

  sso_enabled = true
}