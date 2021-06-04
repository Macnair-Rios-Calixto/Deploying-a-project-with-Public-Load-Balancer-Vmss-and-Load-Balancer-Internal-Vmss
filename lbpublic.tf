# Create a Load Balancer Frontend
resource "azurerm_lb" "lb_Frontend" {
  name                = var.lb_frontend
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  frontend_ip_configuration {
    name                 = "LB-Frontend"
    public_ip_address_id = azurerm_public_ip.pip_lb_pub.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_pub_bpool" {
  loadbalancer_id = azurerm_lb.lb_Frontend.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lb_front_probe" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.lb_Frontend.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/"
  port                = 80
}

resource "azurerm_lb_rule" "lb_front_rule" {
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.lb_Frontend.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LB-Frontend"
  probe_id                       = azurerm_lb_probe.lb_front_probe.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_pub_bpool.id
}