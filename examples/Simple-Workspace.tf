module "Simple-Workspace" {
  source          = "./module/workspace"
  
  organization                  = var.organization
  name                          = "Simple-Workspace"
  description                   = "Simple Terraform workspace module implimentation"
}
