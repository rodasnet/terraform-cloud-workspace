module "aws-acct-dev-02" {
  source = "./module/workspace"

  workspace_settings = {
    organization = "rodasnet"
    description = "Second something really special"
    repo_name = "terraform-rodasnet.com"
    workspace_name = "aws-acct-dev-02"
  }
}
