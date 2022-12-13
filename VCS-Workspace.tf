module "VCS-Workspace" {
  source          = "./module/workspace"
  
  organization                  = var.organization
  name                          = "VCS-Workspace"
  description                   = "Terraform workspace with VCS configuration"

  vcs_repo = {
      repo_name      = "terraform-rodasnet.com"
      oauth_token_id = tfe_oauth_client.oauth_client.oauth_token_id
    }
}
