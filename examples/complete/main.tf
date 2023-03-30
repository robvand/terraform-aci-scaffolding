module "ospf_route_summarization_policy" {
  source           = "netascode/ospf_route_summarization_policy"
  version          = ">= 0.1.0"
  name             = "ABC"
  tenant           = "TEN1"
  description      = "My OSPF Route Summarization Policy"
  interAreaEnabled = "true"
  cost             = "300"
}