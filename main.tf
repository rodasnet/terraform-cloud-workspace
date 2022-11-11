resource "tfe_workspace" "test" {
  name         = "rodasnet-test"
  organization = "rodasnet"
  tag_names    = ["test", "app"]
}

