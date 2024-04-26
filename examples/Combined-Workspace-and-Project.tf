module "Combined-Workspace-and-Project-Beta" {
  source = "../"

  # note: both the tfc workspace and project resources are created as standalone

  workspace_definition = {
    organization = var.organization
    name         = "Combined-Workspace-and-Project-Beta"
    description  = "Combined module with workspace and project currently in development."
  }

  project_definition = {
    organization = var.organization
    name         = "Combined-Project-and-Project-Beta"
    description = "Combined module with workspace and project currently in development."
  }
}
