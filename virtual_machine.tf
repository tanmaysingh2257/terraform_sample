resource "azurerm_windows_virtual_machine" "virtual_machine" {
  count = length(var.VM_Subnet_Map)

  name                  = var.VM_Subnet_Map[count.index].VM_Name
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = azurerm_resource_group.resource_group.location
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  admin_password        = data.azurerm_key_vault_secret.key_vault_secret.value
  network_interface_ids = [azurerm_network_interface.network_interface["${var.VM_Subnet_Map[count.index].VM_Name}_subnet"].id]

  os_disk {
    name                 = "${var.VM_Subnet_Map[count.index].VM_Name}_os_disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 127
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
