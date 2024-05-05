locals {
    csv_file = csvdecode(file(var.members_filepath))
    members = tomap({ for member in local.csv_file : member.name => member })
}