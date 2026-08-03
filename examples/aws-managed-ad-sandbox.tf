module "aws-managed-ad-sandbox" {
  source = "../archive/workspaces-only"

  organization                  = var.organization
  name                          = "aws-managed-ad-sandbox"
  description                   = "AWS Managed Microsoft AD Standard Edition - sandbox"

  auto_apply                    = false
  assessments_enabled           = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  additional_tags_list          = ["aws", "directory-service", "managed-ad", "sandbox"]

  vcs_repo = {
    identifier     = "rodasnet/terraform-aws-managed-ad"
    branch         = "main"
    oauth_token_id = var.github_oauth_token_id
  }
}
