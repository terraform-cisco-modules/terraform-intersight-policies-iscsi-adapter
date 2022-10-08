module "main" {
  source                 = "../.."
  description            = "${var.name} iSCSI Adapter Policy."
  dhcp_timeout           = 60
  lun_busy_retry_count   = 15
  name                   = var.name
  organization           = "terratest"
  tcp_connection_timeout = 15
}
