data "azurerm_key_vault" "key_vault" {
  name                = "tanmaysingh2257"
  resource_group_name = "playground"
}

data "azurerm_key_vault_secret" "key_vault_secret" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
