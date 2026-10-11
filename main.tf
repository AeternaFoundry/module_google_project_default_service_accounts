resource "google_project_default_service_accounts" "project_default_service_accounts" {
  for_each = var.project_default_service_accounts

  action         = each.value.action
  project        = each.value.project
  restore_policy = each.value.restore_policy

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
    }
  }
}

