#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#__________________________________________________________________
#
# Intersight iSCSI Adapter Policy
# GUI Location: Policies > Create Policy > iSCSI Adapter
#__________________________________________________________________

resource "intersight_vnic_iscsi_adapter_policy" "iscsi_adapter" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  connection_time_out  = var.tcp_connection_timeout
  description          = var.description != "" ? var.description : "${var.name} iSCSI Adapter Policy."
  dhcp_timeout         = var.dhcp_timeout
  lun_busy_retry_count = var.lun_busy_retry_count
  name                 = var.name
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
