module "Workspace-Standalone-1" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "Workspace-Standalone-1"
  }
}

module "Workspace-Project-Link" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "Workspace-Project-Link"
    project_id   = module.Project-Workspace-Link.project_id
  }
}