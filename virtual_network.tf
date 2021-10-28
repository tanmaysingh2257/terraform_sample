resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "subnet" {
  count = length(var.VM_Subnet_Map)

  name                 = "${var.VM_Subnet_Map[count.index].VM_Name}_subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.VM_Subnet_Map[count.index].Subnet_Space]

}

resource "azurerm_network_interface" "network_interface" {
  for_each = { for subnet in azurerm_subnet.subnet : subnet.name => subnet }

  name                = "${each.value.name}_network_interface"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  count = length(var.VM_Subnet_Map)

  network_interface_id      = azurerm_network_interface.network_interface["${var.VM_Subnet_Map[count.index].VM_Name}_subnet"].id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}
