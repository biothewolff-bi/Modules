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
  features {}

  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = "d7f4004e-6d46-4694-8c76-fd90a8c5a0da"
}

provider "azuread" {
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
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


# AD group

resource "azuread_group" "ad" {
  display_name = "GRP_${upper(var.project)}_${upper(var.environment)}"
  owners = concat(["c9e54d7d-b96b-42f1-b1cc-3484fd8a4c72"], var.azuread_owners)
  security_enabled = true
}
