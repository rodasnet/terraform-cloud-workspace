resource "tfe_workspace" "tfe_workspace" {
  name                  = var.workspace_name
  organization          = var.organization

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
