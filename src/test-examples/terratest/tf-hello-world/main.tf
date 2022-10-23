terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

variable "testing_namespace" {
  type = string
}

data "kubernetes_pod" "test" {
  metadata {
    name = "sonobuoy"
    namespace = "sonobuoy"
  }
}

output "hello_world" {
  value = format("Hello, %s!",data.kubernetes_pod.test.metadata[0].name)
}