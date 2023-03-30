variable "tenant" {
  description = "Tenant name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,64}$", var.tenant))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}

variable "name" {
  description = "OSPF route summarization policy name,"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}

variable "description" {
  description = "Specifies a description of the policy definition."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]{0,128}$", var.description))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `\\`, `!`, `#`, `$`, `%`, `(`, `)`, `*`, `,`, `-`, `.`, `/`, `:`, `;`, `@`, ` `, `_`, `{`, `|`, }`, `~`, `?`, `&`, `+`. Maximum characters: 128."
  }
}

variable "interAreaEnabled" {
  description = "Inter Area Summarization enabled."
  type        = bool
  default     = false
}

variable "cost" {
  description = "The OSPF Area cost for the default summary LSAs. The Area cost is used with NSSA and stub area types only."
  type        = string
  default     = "unspecified"

  validation {
    condition     = try(contains(["unspecified"], var.cost), false) || try(tonumber(var.cost) >= 0 && tonumber(var.cost) <= 16777215, false)
    error_message = "Allowed values are `unspecified` or a number between 0 and 16777215."
  }
}