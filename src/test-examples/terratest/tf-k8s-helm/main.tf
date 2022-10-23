terraform {
  required_version = ">= 0.12.26"
}


resource "helm_release" "httpbin" {
  name       = "httpbin"

  repository = "https://matheusfm.dev/charts"
  chart      = "httpbin"
  
  namespace = var.testing_namespace

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

}