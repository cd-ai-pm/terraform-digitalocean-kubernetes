module "digitalocean_kubernetes_cluster" {
  source = "../"

  name        = "example-cluster"
  environment = "prod"
  region      = "nyc1"

  # Enable DOKS SSO support
  sso_enabled = true

  # Other required variables
  critical_node_pool = {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}