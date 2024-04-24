module "Workspace-Import-Resources" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Workspace-Import-Resources"
  description                   = "Terraform workspace to import resources into Terraform state"

  vcs_repo = {
      identifier      = "rodasnet/terraform-import-resources"
      oauth_token_id  = var.github_oauth_token_id
    }

  variable_set_names = [
    "tfe-api-token"
  ]
}
