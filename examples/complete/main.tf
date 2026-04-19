terraform {
  required_version = ">= 1.5"
}

module "terraform-digitalocean-kubernetes" {
  source = "../.."

  name = "terraform-digitalocean-kubernetes-complete"

  tags = {
    Example     = "complete"
    Environment = "test"
  }
}
