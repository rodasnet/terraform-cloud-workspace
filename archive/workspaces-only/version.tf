terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      # TODO: Update provider version for TFC project resources support
      version = "0.53.0"
    }
  }
}
