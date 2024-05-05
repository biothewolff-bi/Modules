locals {
    members = csvdecode(file(var.members_filepath))
}