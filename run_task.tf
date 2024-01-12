resource "tfe_organization_run_task" "org_task" {
    organization = var.organization
    url = "https://api.snyk.io/v1/terraform-cloud/3997a565-cf35-4b0e-8c8d-b59b2f14370a"
    name = "RunTaskOrgSynk"
    enabled = true
    description = "Sync organazational run task."
    hmac_key = var.synk_hmac_key
}

# resource "tfe_workspace_run_task" "work_task" {
#   workspace_id = ""
#   enforcement_level =  ""
#   task_id = ""
#   stage = ""
# }

variable "synk_hmac_key" {
  type = string
  sensitive = true
}
