resource "tfe_workspace_run_task" "workspace_task_synk" {

    for_each = { for config in var.run_task_config_list : config.each => config }
    workspace_id = tfe_workspace.workspace.id
    enforcement_level = each.value.enforcement_level
    task_id = each.value.task_id
    stage = each.value.stage
}

variable "run_task_config_list" {
  type = list(object({
    enforcement_level = optional(string, "advisory")
    task_id = string
    stage = string
  }))

  default = []
}
