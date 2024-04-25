module "Runtask-Workspace" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Runtask-Workspace"
  description                   = "Runtask Terraform workspace."
  additional_tags_list            = ["synk", "poc"]

  run_task_config_list = [
    # {
    #   task_id = data.tfe_organization_run_task.synk.id
    #   stage = "pre_apply"
    # },
    # {
    #   task_id = data.tfe_organization_run_task.synk.id
    #   stage = "post_plan"
    # }
  ]
}
