module "aws-acct-dev-02" {
  source = "./module/workspace"

  workspace_settings = var.my-workspace_settings
}

variable "my-workspace_settings" {
  type = object({
    organization        = "rodasnet"
    description         = "Second something really special"
    repo_name           = "terraform-rodasnet.com"
    workspace_name      = "aws-acct-dev-02"
  })
}
