module "Sandbox-Rodasnet-Com-Site" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "sandbox-rodasnet-com-site"
    description  = "Public platform-engineering portfolio site (sandbox.rodasnet.com) - Static Web App + DNS."
  }
}
