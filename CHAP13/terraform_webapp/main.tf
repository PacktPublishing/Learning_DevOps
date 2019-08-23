terraform {
  backend "azurerm" {}
  required_version = ">= 0.12"
}

provider "azurerm" {}

resource "azurerm_resource_group" "rg-app" {
  name     = var.resource-group-name
  location = "West Europe"
}

resource "azurerm_app_service_plan" "serviceplan-app" {
  name                = var.sp-name
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.rg-app.name #Terraform 0.12

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = var.webapp-name
  location            = "West Europe"
  resource_group_name = "${azurerm_resource_group.rg-app.name}"          #Terraform < 0.12
  app_service_plan_id = "${azurerm_app_service_plan.serviceplan-app.id}" #Terraform < 0.12

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "XXXX-XXX"
    MSDEPLOY_RENAME_LOCKED_FILES   = "1"
    WEBSITE_LOAD_CERTIFICATES      = "*"
    WEBSITE_RUN_FROM_PACKAGE       = "0"
  }
}
