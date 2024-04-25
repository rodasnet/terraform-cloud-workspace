module "Legacy-Workspace-Link-Project.tf" {
  source = "../archive/workspaces-only"

  organization         = var.organization
  name                 = "Legacy-Workspace-Link-Project.tf"
  description          = "Test linking legacy workspace to project."
  additional_tags_list = ["project-link"]
  project_id           = module.Project-Workspace-Link.project_id
}
