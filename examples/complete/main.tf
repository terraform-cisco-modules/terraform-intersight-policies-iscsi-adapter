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
