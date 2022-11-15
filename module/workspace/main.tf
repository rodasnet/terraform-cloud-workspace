resource "tfe_workspace" "this" {
  name                  = var.workspace_name
  organization          = var.organization

  vcs_repo {
    identifier      = "${var.organization}/{var.repo_name}"
    oauth_token_id  = tfe_oauth_client.this.oauth_token_id
  }
}

resource "tfe_oauth_client" "this" {
  name             = "${var.workspace_name}-oauth-client"
  organization     = var.organization
  api_url          = var.oauth_api_url
  http_url         = var.oauth_http_url
  oauth_token      = var.oauth_token
  service_provider = var.oauth_service_provider
}
