# Create a public IP Load Balancer Pubic
resource "azurerm_public_ip" "pip_lb_pub" {
  name                = var.public_ip_lb_pub
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method  = "Static"
  sku                 = "Basic"
}

