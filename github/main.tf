
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
  for_each = local.members

  username = each.key
  role = each.value.org_role
}

resource "github_team" "project_team" {
  name = "${var.project} Team"
}

resource "github_team_members" "project_team_members" {
  team_id  = github_team.team.id

  dynamic "members" {
    for_each = local.members
    content {
      username = members.key
      role = members.value.team_role
    }
  }
}
