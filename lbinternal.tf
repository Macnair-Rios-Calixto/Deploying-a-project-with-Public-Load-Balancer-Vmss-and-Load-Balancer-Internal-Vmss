# Create a Load Balancer Backend
resource "azurerm_lb" "lb_backend" {
  name                = var.lb_backend
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  frontend_ip_configuration {
    name                          = "LB-Backend"
    subnet_id                     = azurerm_subnet.sub_back.id
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.100.200"
  }
}

resource "azurerm_lb_backend_address_pool" "lb_int_bpool" {
  loadbalancer_id = azurerm_lb.lb_backend.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lb_back_probe" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.lb_backend.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/"
  port                = 80
}

resource "azurerm_lb_rule" "lb_back_rule" {
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.lb_backend.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LB-Backend"
  probe_id                       = azurerm_lb_probe.lb_back_probe.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_int_bpool.id
}
