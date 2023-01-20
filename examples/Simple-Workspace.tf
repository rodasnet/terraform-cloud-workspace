module "Simple-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "Simple-Workspace-2"
  description                   = "Simple Terraform workspace module implimentation - test fix"
  additional_tags_list            = ["who", "wants", "more"]
}
