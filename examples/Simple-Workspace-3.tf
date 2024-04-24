module "Simple-Workspace-3" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Simple-Workspace-3"
  description                   = "Simple Terraform workspace module implimentation - test fix"
  additional_tags_list            = ["who", "wants", "more", "features"]
}
