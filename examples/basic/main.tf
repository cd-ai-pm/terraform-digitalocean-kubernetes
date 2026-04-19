terraform {
  required_version = ">= 1.5"
}

module "terraform-digitalocean-kubernetes" {
  source = "../.."

  # Minimal required inputs. Replace placeholders before running `terraform apply`.
  # See variables.tf for the full surface.
  name = "terraform-digitalocean-kubernetes-basic"
}
