module "Runtask-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "Runtask-Workspace"
  description                   = "Runtask Terraform workspace."
  additional_tags_list            = ["synk", "poc"]
}
