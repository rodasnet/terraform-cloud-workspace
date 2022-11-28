module "aws-acct-dev-04" {
  source = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name      = "aws-acct-dev-04"
    description         = "Fourth something really special"
    terraform_version   = "1.0.0"
  }
}
