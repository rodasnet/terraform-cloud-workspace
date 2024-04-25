module "Workspace-Standalone-1" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "Workspace-Standalone-1"
    # policy_set_links = [
    #   {
    #     policy_set_id = module.Project-PolicySet-1.policy_sets[0].id
    #   }
    # ]
  }
}

module "Workspace-Project-Link" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "Workspace-Project-Link"
    project_id   = module.Project-Workspace-Link.project_id
    # policy_set_links = [
    #   {
    #     policy_set_id = module.Project-PolicySet-1.policy_sets[0].id
    #   }
    # ]
  }
}