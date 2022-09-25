<!-- BEGIN_TF_DOCS -->
# iSCSI Adapter Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "iscsi_adapter" {
  source  = "terraform-cisco-modules/policies-iscsi-adapter/intersight"
  version = ">= 1.0.1"

  description            = "default iSCSI Adapter Policy."
  dhcp_timeout           = 60
  name                   = "default"
  lun_busy_retry_count   = 15
  organization           = "default"
  tcp_connection_timeout = 15
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->