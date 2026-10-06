# One-time reconciliation: the azure-policy workspace was auto-created by
# `terraform init` in rodasnet/terraform-azure-policy before this managing run
# ever applied, so tf_cloud_workspace state never tracked it. Adopt it here;
# safe to remove this import block after the run applies.
import {
  to = module.Azure-Policy.tfe_workspace.workspace[0]
  id = "rodasnet/azure-policy"
}

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
