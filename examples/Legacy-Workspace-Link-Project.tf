module "Legacy-Workspace-Link-Project" {
  source = "../archive/workspaces-only"

  organization         = var.organization
  name                 = "Legacy-Workspace-Link-Project"
  description          = "Test linking legacy workspace to project."
  additional_tags_list = ["project-link"]
  project_id           = module.Project-Workspace-Link.project_id
}
