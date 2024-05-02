locals {
  adf_gh_account_name    = "TestingThings404"
  adf_gh_branch_name     = "master"
  adf_gh_repository_name = "SpiceCraft.Finance"
  adf_gh_root_folder     = "/DataFactory/adf-${var.project}-${var.location}-${var.environment}-01"

  ad_members = csvdecode(file("${path.module}/members.csv"))
}