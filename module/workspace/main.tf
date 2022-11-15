resource "tfe_workspace" "tfe_workspace" {
  name                  = var.workspace_name
  organization          = var.organization
  description           = var.description == "" ? "Workspace ${var.workspace_name}" : var.description
  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  ssh_key_id            = var.ssh_key_id
  allow_destroy_plan    = var.allow_destroy_plan

  vcs_repo {
    identifier      = "${var.organization}/${var.repo_name}"
    oauth_token_id  = tfe_oauth_client.tfe_oauth_client.oauth_token_id
    branch          = var.branch
  }
}

resource "tfe_oauth_client" "tfe_oauth_client" {
  name             = "${var.workspace_name}-oauth-client"
  organization     = var.organization
  api_url          = var.oauth_api_url
  http_url         = var.oauth_http_url
  oauth_token      = var.oauth_token
  service_provider = var.oauth_service_provider
}
