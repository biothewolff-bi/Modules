# Azure client variables

variable "azure_tenant_id" {
  description = "The Azure tenant ID"
  type = string
}

variable "azure_subscription_id" {
  description = "The Azure subscription ID"
  type = string
}

variable "azure_client_id" {
  description = "The Azure Client ID"
  type = string
}

variable "azure_client_secret" {
  description = "The Azure Client secret used to log in"
  type = string
  sensitive = true
}


# Azure project variables

variable "azure_location" {
  description = "Geographical location of the ressources (weu, ne, us, ...)"
  type        = string
  default     = "dev"
}

variable "azuread_owners" {
  description = "Owners of the Azure AD"
  type        = list(string)
}
