output "workspace_id" {
  value = tfe_workspace.workspace[0].id
}

# output "workspace_link_ids" {
#   value = tfe_project.project[0].workspace_ids
# }
