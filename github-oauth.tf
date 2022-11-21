resource "tfe_oauth_client" "oauth_client" {
  name             = "${var.global_settings.organization}-oauth-client"
  organization     = var.global_settings.organization
  oauth_token      = var.github_token
  api_url          = var.github_oauth_client.api_url
  http_url         = var.github_oauth_client.http_url
  service_provider = var.github_oauth_client.service_provider
}
