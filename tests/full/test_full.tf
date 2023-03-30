terraform {
  required_version = ">= 1.0.0"

  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

resource "aci_rest_managed" "fvTenant" {
  dn         = "uni/tn-TF"
  class_name = "fvTenant"
}

module "main" {
  source = "../.."

  tenant = aci_rest_managed.fvTenant.content.name
  name = "OSPF-POL"
  description = "My Description"
  interAreaEnabled = true
  cost = "300"
}

data "aci_rest_managed" "ospfRtSummPol" {
  dn = module.main.dn

  depends_on = [module.main]
}

resource "test_assertions" "ospfRtSummPol" {
  component = "ospfRtSummPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest_managed.ospfRtSummPol.content.name
    want        = module.main.name
  }

  equal "description" {
    description = "description"
    got         = data.aci_rest_managed.ospfRtSummPol.content.descr
    want        = "My Description"
  }  

  equal "interAreaEnabled" {
    description = "interAreaEnabled"
    got         = data.aci_rest_managed.ospfRtSummPol.content.interAreaEnabled
    want        = true
  }  

  equal "cost" {
    description = "cost"
    got         = data.aci_rest_managed.ospfRtSummPol.content.cost
    want        = "300"
  }  
}
