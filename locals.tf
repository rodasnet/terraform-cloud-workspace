locals {
  default_tags = {
    Terraform = "TfcManagedWorkspace"
  }

  tags_merged = concat(values(locals.default_tags), var.tag_names)
}
