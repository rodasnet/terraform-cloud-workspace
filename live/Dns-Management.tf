module "Dns-Management" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "dns-management"
    description  = "Terraform-managed DNS for every in-scope rodasnet/personal-brand domain - Azure DNS primary, DigitalOcean standby. Runs as the federated tfc-dns-management SPN (OIDC)."

    vcs_repo = {
      identifier     = "rodasnet/dns-management"
      branch         = "main"
      oauth_token_id = var.github_oauth_token_id
    }
  }
}
