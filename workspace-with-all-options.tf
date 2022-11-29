module "workspace-with-all-options" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name = "workspace-with-all-options"
    description    = "Second something really special"
    terraform_version = "1.0.0"
    
  }
}
