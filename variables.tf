variable "gw_object" {
  description = "Aviatrix Transit Gateway object with all of it's attributes."
}

variable "tunnel_cidrs" {
  type = list(string)
  default = [
    "169.254.101.0/30",
    "169.254.102.0/30",
    "169.254.103.0/30",
    "169.254.104.0/30",
  ]
}

variable "aviatrix_asn" {
  description = "The ASN of the Aviatrix transit gateway"
  type        = number
}

variable "tgw_asn" {
  description = "The ASN configured on the TGW"
  type        = number
}

variable "tgw_id" {
  description = "The ID of the TGW"
  type        = string
}

variable "connection_name" {
  description = "Name to use to create the S2C connections on the Aviatrix gateways"
  type        = string
  default     = ""
}

variable "enable_learned_cidrs_approval" {
  description = "Set to true to enable learned CIDR's approval"
  default     = false
}

variable "approved_cidrs" {
  description = "A list of approved CIDRs for when enable_learned_cidrs_approval is true."
  default     = null
}

variable "aws_vpn_connection_name" {
  description = "Name of AWS S2S VPN tunnel."
  type        = string
  default     = null
}

locals {
  is_ha           = var.gw_object.ha_gw_size != null
  connection_name = length(var.connection_name) > 0 ? var.connection_name : "${var.gw_object.gw_name}_to_tgw"
}
