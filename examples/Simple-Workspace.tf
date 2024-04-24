module "Simple-Workspace" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Simple-Workspace-2"
  description                   = "Simple Terraform workspace module implimentation - test fix"
  additional_tags_list            = ["who", "wants", "more", "features"]
}
