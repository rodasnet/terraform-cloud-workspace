resource "tfe_workspace" "workspace" {
  organization      = var.global_settings.organization
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
