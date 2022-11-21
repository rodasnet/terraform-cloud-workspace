module "aws-acct-dev-01" {
  source = "./module/workspace"
  global_settings = var.global_settings
  
  workspace_settings = {
    workspace_name      = "aws-acct-dev-01"
    description         = "Second something really special"
  }
}

