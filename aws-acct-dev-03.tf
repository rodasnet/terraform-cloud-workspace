module "aws-acct-dev-03" {
  source = "./module/workspace"
  organization = var.organization

  workspace_settings = {
    workspace_name      = "aws-acct-dev-03"
    description         = "Third something really special"
    # repo_name           = "terraform-rodasnet.com"
  }
}
