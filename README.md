# cloud-platform-terraform-ingress-controller

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-k8s-ingress-controller/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-k8s-ingress-controller/releases)

Terraform module used by the Cloud Platform team to create an fallback ingress-controller.

## Usage

```hcl
module "k8s_ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-teams-k8s-controller?ref=0.0.1"



  # This module dependencies
  dependence_prometheus  = helm_release.prometheus_operator
  dependence_certmanager = helm_release.cert-manager

  # Will be used as the ingress controller name and the class annotation
  controller_name        = "k8s"
  # No of replicas 
  replica_count          = "6"
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
