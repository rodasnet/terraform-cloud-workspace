module "Azure-Golden-Path-Test" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "azure-golden-path-test"
    description  = "Disposable smoke test of the new-terraform-project.sh golden path - safe to delete."

    vcs_repo = {
      identifier     = "rodasnet/azure-golden-path-test"
      branch         = "main"
      oauth_token_id = var.github_oauth_token_id
    }
  }
}
