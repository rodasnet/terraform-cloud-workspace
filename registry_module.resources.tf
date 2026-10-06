resource "tfe_registry_module" "this" {
  count = var.registry_module_definition != null ? 1 : 0

  vcs_repo {
    identifier         = var.registry_module_definition.identifier
    display_identifier = var.registry_module_definition.identifier
    oauth_token_id     = var.registry_module_definition.oauth_token_id
    branch             = try(var.registry_module_definition.branch, "")
    tags               = true
  }
}
