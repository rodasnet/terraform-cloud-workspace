module "example-workspace-with-vcs" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name = "example-workspace-with-vcs"
    description    = "Third something really special"
    vcs = {
      repo_name      = "terraform-rodasnet.com"
      oauth_token_id = tfe_oauth_client.oauth_client.oauth_token_id
    }
  }
}
