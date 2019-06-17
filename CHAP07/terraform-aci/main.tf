provider "azurerm" {}

resource "azurerm_resource_group" "acidemobook" {
  name     = "demoBook"
  location = "westus2"
}

resource "azurerm_container_group" "aci-myapp" {
  name                = "aci-agent"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.acidemobook.name
  ip_address_type     = "public"
  os_type             = "linux"

  container {
    name   = "myappdemo"
    image  = "docker.io/mikaelkrief/demobook:v1"
    cpu    = "0.5"
    memory = "1.5"
    port   = "80"
  }

}
