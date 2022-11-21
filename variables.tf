// Need for TFE provider configuration
variable "tf_token" {
  type      = string
  sensitive = true
    default = null
}
