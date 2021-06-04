# Create a Subnet Backend
resource "azurerm_subnet" "sub_back" {
  name                 = var.sub_backend
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.100.0/24"]
}
