resource "tfe_workspace_run_task" "workspace_task_synk" {
    count = length(var.run_task_config_list)

    workspace_id = tfe_workspace.workspace.id
    enforcement_level = var.run_task_config_list[count.index].enforcement_level
    task_id = var.run_task_config_list[count.index].task_id
    stage = var.run_task_config_list[count.index].stage
}

variable "run_task_config_list" {
  type = list(object({
    enforcement_level = optional(string, "advisory")
    task_id = string
    stage = string
  }))

  default = []
}


##############################################################################################
# resource "tfe_workspace_run_task" "workspace_task_synk" {
# 
#     for_each = { for config in var.run_task_config_list : config.index => config }
#     workspace_id = tfe_workspace.workspace.id
#     enforcement_level = each.value.enforcement_level
#     task_id = each.value.task_id
#     stage = each.value.stage
# }
##############################################################################################
