module "Azure-Policy" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "azure-policy"
    description  = "Azure Policy as code - CIS 3.0 + landing-zone initiatives and assignments for the Rodasnet tenant. Runs as the federated tfc-azure-policy SPN (OIDC)."

    vcs_repo = {
      identifier     = "rodasnet/terraform-azure-policy"
      branch         = "main"
      oauth_token_id = var.github_oauth_token_id
    }
  }
}
