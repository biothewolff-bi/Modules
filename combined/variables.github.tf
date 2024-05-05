
# Provider variables

variable "gh_token" {
  description = "The Github PAT to log in with"
  type = string
  sensitive = true
}


# Project variables

variable "gh_organization_name" {
  description = "le nom de l'organisation Github"
  type = string
}

variable "gh_project_admin" {
  description = "The username of the project administrator"
  type = string
}

variable "gh_members_filepath" {
  description = "File path to the CSV of github organisation and team members"
  type = string
}
