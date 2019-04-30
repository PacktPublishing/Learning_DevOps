# Get the azure Key Vault
data "azurerm_key_vault" "mykeyvault" {
  name                = "mytfkeyvault"
  resource_group_name = "my_rg"
}

# Get the Azure Kay vault Specific secret value
data "azurerm_key_vault_secret" "mykeyvault-secret" {
  name      = "vmLinux"
  vault_uri = "${data.azurerm_key_vault.mykeyvault.vault_uri}"
}
