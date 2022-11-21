module "aws-acct-dev-01" {
  source = "./constructor"

  workspace_settings = {
    description = "Something really special"
    repo_name = "terraform-rodasnet.com"
    workspace_name = "aws-acct-dev-01"
  }
}
