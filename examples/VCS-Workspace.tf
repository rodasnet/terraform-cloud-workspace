module "VCS-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "VCS-Workspace"
  description                   = "Terraform workspace with VCS configuration"

  vcs_repo = {
      identifier      = "daniel-rodas/sample-terraform"
      oauth_token_id = var.github_oauth_client.oauth_token_id
    }
}
