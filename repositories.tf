# Create application repository
resource "github_repository" "github-webhook" {
  name = "github-webhook"
}

# Add memberships for application repository
resource "github_team_repository" "github-webhook" {
  for_each = {
    for team in local.repo_teams_files["github-webhook"] :
    team.team_name => {
      team_id    = github_team.all[team.team_name].id
      permission = team.permission
    } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.github-webhook.id
  permission = each.value.permission
}
/*
# Create infrastructure repository
resource "github_repository" "infrastructure-as-code" {
  name = "learn-tf-infrastructure"
}

# Add memberships for infrastructure repository
resource "github_team_repository" "infrastructure-as-code" {
  for_each = {
  for team in local.repo_teams_files["infrastructure-as-code"] :
  team.team_name => {
    team_id    = github_team.all[team.team_name].id
    permission = team.permission
  } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.infrastructure-as-code.id
  permission = each.value.permission
}
*/
# Create infrastructure repository
resource "github_repository" "test-webhook" {
  name       = "test-webhook"
  has_issues = true
  auto_init  = true
}

# Create infrastructure repository
resource "github_repository" "iac-github-demo" {
  name = "iac-github-demo"
}

# Add memberships for infrastructure repository
resource "github_team_repository" "iac-github-demo" {
  for_each = {
  for team in local.repo_teams_files["iac-github-demo"] :
  team.team_name => {
    team_id    = github_team.all[team.team_name].id
    permission = team.permission
   } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.iac-github-demo.id
  permission = each.value.permission
}

