
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
