
# Provider 

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }
  }
}

provider "github" {
    owner = var.organization_name
    token = var.github_token
}


# Resources

resource "github_membership" "members" {
  for_each = tomap({ for member in local.members : member.name => member })

  username = each.key
  role = each.value.org_role
}
