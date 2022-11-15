
variable "organization" {
  type    = string
  default = "rodasnet"
}

variable "tf_token" {
  type      = string
  sensative = true
}

variable "github_token" {
  type      = string
  sensative = true
}
