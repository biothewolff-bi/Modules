
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

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted_key_vaults = true
    }
  }

  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
}

provider "azuread" {
  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id = var.azure_tenant_id
}


# Configuring modules

module "azure" {
    source = "../azure"

    # Azure client
    client_id = var.azure_client_id
    client_secret = var.azure_client_secret
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
