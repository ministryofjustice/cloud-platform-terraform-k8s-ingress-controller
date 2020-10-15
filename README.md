# cloud-platform-terraform-ingress-controller

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-k8s-ingress-controller/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-k8s-ingress-controller/releases)

Terraform module used by the Cloud Platform team to create an fallback ingress-controller.

## Usage

```hcl
module "k8s_ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-k8s-ingress-controller?ref=0.0.1"

  # boolean expression for applying standby ingress-controller for live-1 cluster only.
  enable_fallback_ingress_controller     = terraform.workspace == local.live_workspace ? true : false
  # Will be used as the ingress controller name and the class annotation
  controller_name        = "k8snginx"
  replica_count          = "3"

  # This module requires prometheus and certmanager
  dependence_prometheus  = module.prometheus.helm_prometheus_operator_status
  dependence_certmanager = module.cert_manager.helm_cert_manager_status
}
```

## Inputs

| Name                            | Description                                                   | Type | Default | Required |
|---------------------------------|---------------------------------------------------------------|:----:|:-------:|:--------:|
| dependence_prometheus  | Prometheus Dependence variable                                         | string   |       | yes |
| dependence_certmanager | This module deploys lets-encrypt certs, so it depends on certmanager   | string   |       | yes |
| controller_namer       | This will be used as the ingress controller name and class annotation  | string   |       | yes |
| replica_count          | No of replicas                                                         | string   |       | yes |


## Outputs

```
helm_nginx_ingress_status
```
