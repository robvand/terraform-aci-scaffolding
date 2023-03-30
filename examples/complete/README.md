<!-- BEGIN_TF_DOCS -->
# Scaffolding Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

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
<!-- END_TF_DOCS -->