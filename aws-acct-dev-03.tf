module "aws-acct-dev-03" {
  source = "./module/workspace"
  organization = var.organization

  oauth_token_2 = var.github_token

  workspace_settings = {
    workspace_name      = "aws-acct-dev-03"
    description         = "Third something really special"
    # vcs = {
    #   repo_name = "terraform-rodasnet.com"
    #   # oauth_token_id = tfe_oauth_client.oauth_client.oauth_token_id
    # }
  }
}
