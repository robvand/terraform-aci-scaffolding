output "dn" {
  value       = aci_rest_managed.ospfRtSummPol.id
  description = "Distinguished name of `ospfRtSummPol` object."
}

output "name" {
  value       = aci_rest_managed.ospfRtSummPol.content.name
  description = "OSPF route summarization policy name."
}
