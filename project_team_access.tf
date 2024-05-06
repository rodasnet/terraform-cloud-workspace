locals {
  project_teams = var.project_definition != null && try(var.project_definition.teams, null) != null ? var.project_definition.teams : toset([])
}
resource "tfe_team" "project_team" {
  
  for_each = toset(keys({ for k,v in local.project_teams: k => v })) 

  name = local.project_teams[each.value]["name"]
  organization = "rodasnet"
}

# resource "tfe_team_project_access" "project_access" {

#     for_each = local.project_teams

#     access       = each.value.access
#     team_id      = each.key
#     project_id   = tfe_project.project[0].id
# }

# resource "tfe_team" "project_team_count" {
  
#   count = try(var.project_definition, null) != null && try(var.project_definition.teams, null) != null ? length(var.project_definition.teams) : 0

#   name = var.project_definition.teams[count.index].name
#   organization = "rodasnet"
# }

# resource "tfe_team_project_access" "project_access_count" {

#     # count = length(tfe_team.project_team)
#     count = try(var.project_definition, null) != null && try(var.project_definition.teams, null) != null ? length(var.project_definition.teams) : 0

#     access       = var.project_definition.teams[count.index].access
#     team_id      = tfe_team.project_team[count.index].id
#     project_id   = tfe_project.project[0].id
# }