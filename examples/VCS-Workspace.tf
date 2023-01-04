module "VCS-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "VCS-Workspace"
  description                   = "Terraform workspace with VCS configuration"

  vcs_repo = {
      identifier      = "fake-org-1/terraform-rodasnet.com"
      oauth_token_id = tfe_oauth_client.oauth_client.oauth_token_id
    }
}
