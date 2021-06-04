# Create a Subnet Frontend
resource "azurerm_subnet" "sub_front" {
  name                 = var.sub_frontend
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

