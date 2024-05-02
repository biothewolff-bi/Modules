# Providers

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}


# Resources

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.location}-${var.environment}"
  location = "West Europe"
}

resource "azurerm_key_vault" "kv" {
  name = "kv${var.project}${var.location}${var.environment}01"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name = "standard"
  tenant_id = var.tenant_id
}

resource "azurerm_data_factory" "adf" {
  name = "adf-${var.project}-${var.location}-${var.environment}-01"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "github_configuration" {
    for_each = var.environment == "dev" ? [true] : []

    content {
      git_url = "https://github.com/"
      account_name = local.adf_gh_account_name
      branch_name = local.adf_gh_branch_name
      repository_name = local.adf_gh_repository_name
      root_folder = local.adf_gh_root_folder
    }
  }
}


# AD group

resource "azuread_group" "ad" {
  display_name = "GRP_${upper(var.project)}_${upper(var.environment)}"
  security_enabled = true

  owners = concat(["c9e54d7d-b96b-42f1-b1cc-3484fd8a4c72"], var.azuread_owners)
  members = local.ad_members[*].id
}

resource "azurerm_role_assignment" "ad_contributor_role" {
  role_definition_name = "Contributor"
  scope = "/subscriptions/${var.subscription_id}"
  principal_id = azuread_group.ad.object_id
}