module "Azure-Platform" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "azure-platform"
    description  = "High-level Terraform management of the Rodasnet Azure tenant - MG hierarchy, subscription placement, governance baseline, TFC onboarding automation."

    vcs_repo = {
      identifier     = "rodasnet/azure-platform"
      branch         = "main"
      oauth_token_id = var.github_oauth_token_id
    }
  }
}
