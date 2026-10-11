variable "project_default_service_accounts" {
  description = <<EOT
Map of project_default_service_accounts, attributes below
Required:
    - action
    - project
Optional:
    - restore_policy
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
EOT

  type = map(object({
    action         = string
    project        = string
    restore_policy = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.project_default_service_accounts : (
        contains(["DEPRIVILEGE", "DELETE", "DISABLE"], v.action)
      )
    ])
    error_message = "must be one of: \"DEPRIVILEGE\", \"DELETE\", \"DISABLE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.project_default_service_accounts : (
        v.restore_policy == null || (contains(["NONE", "REVERT", "REVERT_AND_IGNORE_FAILURE"], v.restore_policy))
      )
    ])
    error_message = "must be one of: \"NONE\", \"REVERT\", \"REVERT_AND_IGNORE_FAILURE\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

