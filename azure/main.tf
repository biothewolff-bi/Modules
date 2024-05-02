terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id = "b931af0a-6af4-4684-876a-795ac75012f4"
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = "d7f4004e-6d46-4694-8c76-fd90a8c5a0da"
}

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
