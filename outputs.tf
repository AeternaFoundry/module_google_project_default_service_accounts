output "project_default_service_accounts_id" {
  description = "Map of id values across all project_default_service_accounts, keyed the same as var.project_default_service_accounts except keys with no id are omitted"
  value       = { for k, v in google_project_default_service_accounts.project_default_service_accounts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "project_default_service_accounts_action" {
  description = "Map of action values across all project_default_service_accounts, keyed the same as var.project_default_service_accounts except keys with no action are omitted"
  value       = { for k, v in google_project_default_service_accounts.project_default_service_accounts : k => v.action if v.action != null && length(v.action) > 0 }
}
output "project_default_service_accounts_project" {
  description = "Map of project values across all project_default_service_accounts, keyed the same as var.project_default_service_accounts except keys with no project are omitted"
  value       = { for k, v in google_project_default_service_accounts.project_default_service_accounts : k => v.project if v.project != null && length(v.project) > 0 }
}
output "project_default_service_accounts_restore_policy" {
  description = "Map of restore_policy values across all project_default_service_accounts, keyed the same as var.project_default_service_accounts except keys with no restore_policy are omitted"
  value       = { for k, v in google_project_default_service_accounts.project_default_service_accounts : k => v.restore_policy if v.restore_policy != null && length(v.restore_policy) > 0 }
}
output "project_default_service_accounts_service_accounts" {
  description = "Map of service_accounts values across all project_default_service_accounts, keyed the same as var.project_default_service_accounts except keys with no service_accounts are omitted"
  value       = { for k, v in google_project_default_service_accounts.project_default_service_accounts : k => v.service_accounts if v.service_accounts != null && length(v.service_accounts) > 0 }
}

