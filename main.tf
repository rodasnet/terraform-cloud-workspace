resource "tfe_organization" "test-organization" {
  name  = "rodasnet"
  email = "daniel@rodasnet.com"
}

resource "tfe_workspace" "test" {
  name         = "rodasnet-test"
  organization = tfe_organization.test-organization.name
  tag_names    = ["test", "app"]
}

