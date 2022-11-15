resource "tfe_workspace" "this" {
  name                  = var.workspace_name
  organization          = var.organization

  description           = var.description == "" ? "Workspace ${var.workspace_name}" : var.description 

  // Optional variables
//  auto_apply            = var.auto_apply // default fales
//  file_triggers_enabled = var.file_triggers_enabled // default true
//  ssh_key_id            = var.ssh_key_id


  vcs_repo {
    identifier      = "${var.organization}/{var.repo_name}"
    oauth_token_id  = tfe_oauth_client.this.oauth_token_id
  //  branch          = var.branch
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
