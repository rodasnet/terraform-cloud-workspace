module "Standalone-Workspace-and-Project-Beta" {
  source = "../"

  # note: both the tfc workspace and project resources are created as standalone

  workspace_definition = {
    organization = var.organization
    name         = "Standalone-Workspace-Beta"
    description  = "Standalone workspace and project created in a single module call, currently in development."
  }

  project_definition = {
    organization = var.organization
    name         = "Standalone-Project-Beta"
    description = "Standalone workspace and project created in a single module call, currently in development."
  }
}
