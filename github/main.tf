
# Provider 

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }
  }
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
  team_id  = github_team.project_team.id

  dynamic "members" {
    for_each = local.members
    content {
      username = members.key
      role = members.value.team_role
    }
  }
}

resource "github_repository" "project_repo" {
  name = "${var.organization_name}.Project.${var.project}"
  visibility = "private"
}

resource "github_repository_collaborators" "project_repo_collab" {
  repository = github_repository.project_repo.name

  user {
    permission = "admin"
    username   = var.project_admin
  }

  team {
    permission = "push"
    team_id    = github_team.project_team.slug
  }
}
