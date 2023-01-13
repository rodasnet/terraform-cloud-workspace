locals {
  default_tags = {
    Terraform = "tfc-managed"
  }

  tags_merged = concat(tolist(values(local.default_tags)), tolist(var.tag_names == null ? [] : var.tag_names))
}
