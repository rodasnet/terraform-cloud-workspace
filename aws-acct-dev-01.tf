module "aws-acct-dev-01" {
  source = "./module/workspace"

  organization      = var.organization
  tf_token          = var.tf_token
  oauth_token       = var.github_token

  workspace_name    = "aws-acct-dev-01"
  repo_name         = "terraform-rodasnet.com"
}
