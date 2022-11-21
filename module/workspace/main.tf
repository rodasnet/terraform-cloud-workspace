resource "tfe_workspace" "workspace" {
  organization      = var.organization
  name              = var.workspace_settings.workspace_name
  description       = var.workspace_settings.description

  dynamic vcs_repo {
    for_each = var.workspace_settings.vcs != null ? [1] : []
    content {
      identifier      = "${var.organization}/${var.workspace_settings.vcs.repo_name}"
      oauth_token_id  = var.workspace_settings.vcs.oauth_token_id
      branch          = var.workspace_settings.vcs.branch
    }
  }  
}

variable "workspace_settings" {
  type = object({
    workspace_name  = optional(string)
    description     = optional(string)
    vcs             = optional(object({
        repo_name           = string
        oauth_token_id      = string
        branch              = optional(string)
      })
    )
  })
}

# variable "global_settings" {
#   type = object({
#     organization    = optional(string)
#     workspace_name  = optional(string)
#     description     = optional(string)

#     vcs             = optional(map(
#       object({
#         repo_name           = string
#         oauth_token_id      = string
#       })
#     ))
    
#   })

#   default = null
# }

# resource "tfe_oauth_client" "oauth_client" {
#   name             = "${var.workspace_name}-oauth-client"
#   organization     = var.organization
#   api_url          = var.oauth_api_url
#   http_url         = var.oauth_http_url
#   oauth_token      = var.oauth_token
#   service_provider = var.oauth_service_provider
# }

# resource "tfe_variable" "sensitive" {
#   for_each      = var.tfe_variable_sensitive_map

#   key           = each.key
#   value         = each.value
#   category      = "env"
#   sensitive     = true
#   workspace_id  = tfe_workspace.workspace.id
# }

# resource "tfe_variable" "public" {
#   for_each      = var.tfe_variable_public_map

#   key           = each.key
#   value         = each.value
#   category      = "env"
#   sensitive     = false
#   workspace_id  = tfe_workspace.workspace.id
# }
