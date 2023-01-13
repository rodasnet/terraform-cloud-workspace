locals {
  default_tags = {
    Terraform = "TfcManagedWorkspace"
  }

  tags_merged = concat(tolist(values(local.default_tags)), var.tag_names == null ? [] : var.tag_names)
}
