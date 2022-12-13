module "VCS-Workspace" {
  source          = "./module/workspace"
  
  organization                  = var.organization
  name                          = "VCS-Workspace"
  description                   = "Terraform workspace with VCS configuration"
}
