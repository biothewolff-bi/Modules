
# Provider variables

variable "github_token" {
  description = "The Github PAT to log in with"
  type = string
  sensitive = true
}


# Project variables

variable "project" {
  description = "le nom du projet a init"
  type = string
}

variable "organization_name" {
  description = "le nom de l'organisation Github"
  type = string
}

variable "members_filepath" {
  description = "File path to the CSV of github organisation and team members"
  type = string
}
