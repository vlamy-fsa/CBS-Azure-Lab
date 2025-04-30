# modules/vm/main.tf



resource "azurerm_network_interface" "vla-vm-net-int" {
  name                = "${var.prefix}-nic"
  resource_group_name = var.rg_name
  location            = var.rg_location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    administrator = "vincent_lamy"
    ext-facing = "false"
    importance = "low"
    org = "revenue"
    owner = "gso"
    service = "demo"
    team = "fsa"
  }
}



resource "azurerm_linux_virtual_machine" "vla-vm" {
  resource_group_name = var.rg_name
  location = var.rg_location
  name = var.vm_name
  size = var.vm_size
  admin_username                  = var.vm_admin
  admin_password                  = var.vm_password
  disable_password_authentication = false
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface_ids = [
    azurerm_network_interface.vla-vm-net-int.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    administrator = "vincent_lamy"
    ext-facing = "false"
    importance = "low"
    org = "revenue"
    owner = "gso"
    service = "demo"
    team = "fsa"
  }
}
