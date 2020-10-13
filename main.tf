########
# Helm #
########

data "helm_repository" "k8s_ingress_nginx" {
  name = "ingress-nginx"
  url  = "https://kubernetes.github.io/ingress-nginx"
}

resource "helm_release" "k8s_ingress_nginx" {
  name       = var.controller_name
  chart      = "ingress-nginx"
  namespace  = "ingress-controllers"
  repository = data.helm_repository.k8s_ingress_nginx.metadata[0].name
  version    = "3.6.0"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    controller_name = var.controller_name
    default_cert    = var.default_cert
    replica_count   = var.replica_count
  })]

  depends_on = [
    var.dependence_prometheus,
    var.dependence_certmanager
  ]
}
