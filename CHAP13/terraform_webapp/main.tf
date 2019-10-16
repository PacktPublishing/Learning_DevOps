provider "azurerm" {}

variable "package_zip_url" {
  description = "url of the Zip package"
}


resource "azurerm_resource_group" "rg-app" {
  name     = "rgApp"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "serviceplan-app" {
  name                = "planApp"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.rg-app.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "MyWebAppBook"
  location            = "West Europe"
  resource_group_name = "${azurerm_resource_group.rg-app.name}"
  app_service_plan_id = "${azurerm_app_service_plan.serviceplan-app.id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = var.package_zip_url  #Url of the Zip package
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_app_service_slot" "test" {
  name                = "StagedGreen"
  app_service_name    = azurerm_app_service.webapp.name
  location            = "West Europe"
  resource_group_name = "${azurerm_resource_group.rg-app.name}"
  app_service_plan_id = "${azurerm_app_service_plan.serviceplan-app.id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }
}
