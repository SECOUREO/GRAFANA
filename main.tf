variable "grafana_url" {}
variable "grafana_auth" {}

# Import all dashboards in dashboards/ folder
locals {
  dashboards = fileset("${path.module}/dashboards", "*.json")
}

resource "grafana_dashboard" "dashboards" {
  for_each    = local.dashboards
  config_json = file("${path.module}/dashboards/${each.value}")
}