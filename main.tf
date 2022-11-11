resource "tfe_workspace" "test" {
  name         = var.workspace_name
  organization = var.org_name

  # vcs_repo {
  #   identifier = var.vsc_identifier
  #   oauth_token_id = 
  # }
}

resource "tfe_oauth_client" "test" {
  name             = "${var.workspace_name}-oauth-client"
  organization     = "rodasnet"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}