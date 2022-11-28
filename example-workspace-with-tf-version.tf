module "example-workspace-with-tf-version" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name    = "example-workspace-with-tf-version"
    description       = "Fourth something really special"
    terraform_version = "1.0.0"
  }
}
