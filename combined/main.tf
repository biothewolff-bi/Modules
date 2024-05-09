
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
    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }
  }
}


# Configuring modules

module "azure" {
    source = "../azure"

    # Azure client
    subscription_id = var.azure_subscription_id
    tenant_id = var.azure_tenant_id

    # Project
    project = var.project
    location = var.azure_location
    environment = var.environment
    
    # Azure AD configuration
    azuread_owners = var.azuread_owners
    azuread_members_filepath = var.azuread_members_filepath

    providers = {
      azurerm = azurerm
      azuread = azuread
    }
}

module "github" {
  source = "../github"

  organization_name = var.gh_organization_name
  members_filepath = var.gh_members_filepath

  project = var.project
  project_admin = var.gh_project_admin
}
