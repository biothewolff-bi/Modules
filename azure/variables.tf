# Azure variables

variable "tenant_id" {
  description = "The Azure tenant ID"
  type = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type = string
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

variable "azuread_members_filepath" {
  description = "File path to the CSV of AAD members"
  type = string
}
