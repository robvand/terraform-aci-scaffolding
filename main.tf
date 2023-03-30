resource "aci_rest_managed" "ospfRtSummPol" {
  dn         = "uni/tn-${var.tenant}/ospfRtsumm-${var.name}"
  class_name = "RtSummPol"
  content = {
    name             = var.name
    descr            = var.description
    interAreaEnabled = var.interAreaEnabled
    cost             = var.cost
  }
}