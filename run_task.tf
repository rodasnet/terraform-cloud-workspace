
#   for_each = { for config in var.run_task_config_list : config => config.value }
# resource "tfe_workspace_run_task" "example" {
#   workspace_id      = resource.tfe_workspace.example.id
#   task_id           = resource.tfe_organization_run_task.example.id
#   enforcement_level = "advisory"
# }

resource "tfe_workspace_run_task" "workspace_task_synk" {
    count = var.create_runtask == trye ? 1 : 0
    workspace_id = tfe_workspace.workspace.id
    task_id = data.tfe_organization_run_task.synk.id
    enforcement_level = "advisory"
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
