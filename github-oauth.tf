resource "tfe_oauth_client" "oauth_client" {
  name             = "${var.github_oauth_client.organization}-oauth-client"
  organization     = var.github_oauth_client.organization
  api_url          = var.github_oauth_client.oauth_api_url
  http_url         = var.github_oauth_client.oauth_http_url
  oauth_token      = var.github_oauth_client.oauth_token
  service_provider = var.github_oauth_client.oauth_service_provider
}