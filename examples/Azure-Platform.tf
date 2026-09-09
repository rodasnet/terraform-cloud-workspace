module "Azure-Platform" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "azure-platform"
    description  = "High-level Terraform management of the Rodasnet Azure tenant - MG hierarchy, subscription placement, governance baseline, TFC onboarding automation."
  }
}
