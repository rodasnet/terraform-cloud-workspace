module "workspace-test-input-variable-2" {
  source          = "./module/workspace"
  global_settings = var.global_settings
  
   my_description = "This is a description 2"  

  workspace_settings = {
    workspace_name    = "workspace-test-input-variable-2"
    terraform_version = "1.0.0"
  }
}
