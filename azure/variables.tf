# Azure variables

variable "tenant_id" {
  description = "The Azure tenant ID"
  type = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type = string
}

variable "client_id" {
  description = "The Azure Client ID"
  type = string
}

variable "client_secret" {
  description = "The Azure Client secret used to log in"
  type = string
  sensitive = true
}


# Project variables

variable "project" {
  description = "Value of the project's name"
  type        = string
}

variable "location" {
  description = "Geographical location of the ressources (weu, ne, us, ...)"
  type        = string
  default     = "dev"
}

variable "environment" {
  description = "Project's environment"
  type        = string
  default     = "dev"
}

variable "azuread_owners" {
  description = "Owners of the Azure AD"
  type        = list(string)
}
