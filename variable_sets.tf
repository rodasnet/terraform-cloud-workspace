
locals {
  porject_variable_set_links = var.project_definition != null ? toset(var.project_definition.variable_set_links) : toset([])
}
data "tfe_variable_set" "project_vs" {
  for_each = local.porject_variable_set_links

  name         = each.value
  organization = var.project_definition.organization
}

resource "tfe_project_variable_set" "project_variable_set_links" {
  for_each = data.tfe_variable_set.project_vs

  variable_set_id = each.value.id
  project_id    = tfe_project.project[0].id
}

# Version 1 original code
# data "tfe_variable_set" "vs" {
#   for_each = toset(var.variable_set_names)

#   name         = each.value
#   organization = var.organization
# }



# resource "tfe_workspace_variable_set" "vs" {
#   for_each = data.tfe_variable_set.vs

#   variable_set_id = each.value.id
#   workspace_id    = tfe_workspace.workspace[0].id
# }
