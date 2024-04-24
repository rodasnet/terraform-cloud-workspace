module "VCS-Workspace" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "VCS-Workspace"
  description                   = "Terraform workspace with VCS configuration"

  vcs_repo = {
      identifier      = "daniel-rodas/sample-terraform"
      oauth_token_id = var.github_oauth_token_id
    }
}
