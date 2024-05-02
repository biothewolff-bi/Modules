
variable "project" {
  description = "Value of the project's name"
  type        = string
}

variable "environment" {
  description = "Project's environment"
  type        = string
  default     = "dev"
}
