output "workspace_id" {
  value = tfe_workspace.workspace.id
}

output "org_task_category" {
  value = data.tfe_organization_run_task.synk.category
}

output "org_task_description" {
  value = data.tfe_organization_run_task.synk.description
}

output "org_task_enabled" {
  value = data.tfe_organization_run_task.synk.enabled
}

output "org_task_id" {
  value = data.tfe_organization_run_task.synk.id
}

output "org_task_url" {
  value = data.tfe_organization_run_task.synk.url
}
