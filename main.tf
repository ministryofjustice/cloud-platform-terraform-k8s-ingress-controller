########
# Helm #
########

resource "helm_release" "k8s_ingress_nginx" {
  count      = var.enable_fallback_ingress_controller ? 1 : 0
  name       = var.controller_name
  chart      = "ingress-nginx"
  namespace  = "ingress-controllers"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "3.6.0"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    controller_name = var.controller_name
    default_cert    = var.default_cert
    enable_ingress_controller_affinity_and_tolerations = var.enable_ingress_controller_affinity_and_tolerations
    replica_count   = var.replica_count
  })]

  depends_on = [
    var.dependence_prometheus,
    var.dependence_certmanager
  ]
}
