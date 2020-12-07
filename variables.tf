variable "controller_name" {
  type        = string
  description = "Will be used as the ingress controller name and the class annotation"
}

variable "default_cert" {
  type        = string
  description = "Useful if you want to use a default certificate for your ingress controller. Format: namespace/secretName"
  default     = "ingress-controllers/default-certificate"
}

variable "replica_count" {
  type        = string
  description = "Number of replicas set in deployment"
}

variable "dependence_prometheus" {
  type        = string
  description = "When deployed cloud-platform-components integration_test nginx ingress controller, if prometheus is not deployed first it fails because it installs serviceMonitor (CRD from prometheus)"
  default     = "NOTHING"
}

variable "dependence_certmanager" {
  type        = string
  description = "When deployed integration_test nginx ingress controller, if certmanager is not deployed before this module fails because it uses certmanager defaultCertificate"
  default     = "NOTHING"
}

variable "enable_fallback_ingress_controller" {
  description = "Enable to have the fallback ingress-controller"
  default     = false
  type        = bool
}
variable "enable_ingress_controller_affinity_and_tolerations" {
    description = "Enable or not Ingress Controller node affinity (check helm values for the expressions)"
  default     = false
  type        = bool
}