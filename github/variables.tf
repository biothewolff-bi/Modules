

# Project variables

variable "project" {
  description = "le nom du projet a init"
  type = string
}

variable "organization_name" {
  description = "le nom de l'organisation Github"
  type = string
}

variable "project_admin" {
  description = "The username of the project administrator"
  type = string
}

variable "members_filepath" {
  description = "File path to the CSV of github organisation and team members"
  type = string
}
