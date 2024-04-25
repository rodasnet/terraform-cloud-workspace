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