module "wrapper" {
  source = "../"

  for_each = var.items

  # Label variables
  name        = try(each.value.name, each.key)
  environment = try(each.value.environment, var.defaults.environment, "")
  label_order = try(each.value.label_order, var.defaults.label_order, ["name", "environment"])
  managedby   = try(each.value.managedby, var.defaults.managedby, "terraform-do-modules")

  # Module control
  enabled = try(each.value.enabled, var.defaults.enabled, true)

  # Cluster configuration
  region               = try(each.value.region, var.defaults.region, "blr1")
  cluster_version      = try(each.value.cluster_version, var.defaults.cluster_version, "1.31.1-do.5")
  vpc_uuid             = try(each.value.vpc_uuid, var.defaults.vpc_uuid, "")
  auto_upgrade         = try(each.value.auto_upgrade, var.defaults.auto_upgrade, false)
  surge_upgrade        = try(each.value.surge_upgrade, var.defaults.surge_upgrade, false)
  ha                   = try(each.value.ha, var.defaults.ha, true)
  registry_integration = try(each.value.registry_integration, var.defaults.registry_integration, false)
  sso_enabled          = try(each.value.sso_enabled, var.defaults.sso_enabled, false)

  # Node pools
  critical_node_pool = try(each.value.critical_node_pool, var.defaults.critical_node_pool, {})
  app_node_pools     = try(each.value.app_node_pools, var.defaults.app_node_pools, {})

  # Tags and maintenance
  tags               = try(each.value.tags, var.defaults.tags, [])
  maintenance_policy = try(each.value.maintenance_policy, var.defaults.maintenance_policy, { day = "any", start_time = "5:00" })

  # Kubeconfig
  kubeconfig_path = try(each.value.kubeconfig_path, var.defaults.kubeconfig_path, "./kubeconfig")
}
