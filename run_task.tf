
#   for_each = { for config in var.run_task_config_list : config => config.value }
# resource "tfe_workspace_run_task" "example" {
#   workspace_id      = resource.tfe_workspace.example.id
#   task_id           = resource.tfe_organization_run_task.example.id
#   enforcement_level = "advisory"
# }

resource "tfe_workspace_run_task" "workspace_task_synk" {
    # count = var.create_runtask == true ? 1 : 0
    for_each = var.run_task_config_list[*]
    workspace_id = tfe_workspace.workspace.id
    # Why can't I use data inside the root module?
    # task_id = data.tfe_organization_run_task.synk.id
    # enforcement_level = var.run_task_config_list[0].enforcement_level
    # task_id = var.run_task_config_list[0].task_id
    # stage = var.run_task_config_list[0].stage
    enforcement_level = each.value.enforcement_level
    task_id = each.value.task_id
    stage = each.value.stage
}

variable "run_task_config_list" {
  type = list(object({
    enforcement_level = string
    task_id = string
    stage = optional(string)
  }))

  default = null
}

variable "create_runtask" {
  type = bool
  default = false
}
