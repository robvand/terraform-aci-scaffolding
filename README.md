<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/ospf_route_summarization_policy/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/ospf_route_summarization_policy/actions/workflows/test.yml)

# Terraform ACI OSPF Route Summarization module

Manages OSPF route summarization policy

Location in GUI:
`Tenants` » `XXX` » `Policies` » `Protocol` » `OSPF` » `OSPF Route Summarization`

## Examples

```hcl
module "ospf_route_summarization_policy" {
  source           = "netascode/ospf_route_summarization_policy"
  version          = ">= 0.1.0"
  name             = "ABC"
  tenant           = "TEN1"
  description      = "My OSPF Route Summarization Policy"
  interAreaEnabled = "true"
  cost             = "300"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Tenant name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | OSPF route summarization policy name, | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Specifies a description of the policy definition. | `string` | `""` | no |
| <a name="input_interAreaEnabled"></a> [interAreaEnabled](#input\_interAreaEnabled) | Inter Area Summarization enabled. | `bool` | `false` | no |
| <a name="input_cost"></a> [cost](#input\_cost) | The OSPF Area cost for the default summary LSAs. The Area cost is used with NSSA and stub area types only. | `string` | `"unspecified"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `ospfRtSummPol` object. |
| <a name="output_name"></a> [name](#output\_name) | OSPF route summarization policy name. |

## Resources

| Name | Type |
|------|------|
| [aci_rest_managed.ospfRtSummPol](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest_managed) | resource |
<!-- END_TF_DOCS -->