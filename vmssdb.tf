# Create a VMSS Backend
resource "azurerm_windows_virtual_machine_scale_set" "vmss_backend" {
  name                 = var.vmss_backend
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  sku                  = "Standard_B1s"
  instances            = 3
  admin_username       = "admin.macnair"
  admin_password       = "P@ssw0rd2021"
  computer_name_prefix = "VMSS-DB"
  upgrade_mode         = "Automatic"
  #upgrade_mode        = "Manual"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-vmss-db"
    primary = true

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = azurerm_subnet.sub_back.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_int_bpool.id]
      #load_balancer_inbound_nat_rules_ids   = [azurerm_lb_nat_pool.lbnatpool.id]
    }
  }
}