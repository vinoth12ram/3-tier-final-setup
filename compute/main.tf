resource "azurerm_availability_set" "web_availabilty_set" {
  name                = var.web_availibility_set
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_interface" "web-net-interface" {
    count = "${var.vm_count}"
    name = "${var.web_network_interface}-${count.index+1}"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = var.ipconfig_web_name
        subnet_id = var.web_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "web-vm" {
  count = "${var.vm_count}"
  name = "${var.web_win_vm}-${count.index+1}"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [azurerm_network_interface.web-net-interface[count.index].id]
  admin_username = var.web_username
  admin_password = var.web_os_password
  availability_set_id = azurerm_availability_set.web_availabilty_set.id
  size = var.vm_size
  
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.os_type
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  encryption_at_host_enabled = true #Added After Scanning 
  allow_extension_operations = false #Added After Scanning    

}
  
  
  resource "azurerm_availability_set" "app_availabilty_set" {
  name                = var.app_availibility_set
  location            = var.location
  resource_group_name = var.resource_group
 }

resource "azurerm_network_interface" "app-net-interface" {
    count = "${var.vm_count}"
    name = "${var.app_network_interface}-${count.index+1}"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = var.ipconfig_app_name
        subnet_id = var.app_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "app-vm" {
  count = "${var.vm_count}"
  name = "${var.app_win_vm}-${count.index+1}"
  location = var.location
  resource_group_name = var.resource_group
  admin_username = var.app_username
  admin_password = var.app_os_password
  network_interface_ids = [azurerm_network_interface.app-net-interface[count.index].id]
  availability_set_id = azurerm_availability_set.web_availabilty_set.id
  size = var.vm_size

 source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.os_type
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  
   
  encryption_at_host_enabled = true #Added After Scanning 
  allow_extension_operations = false #Added After Scanning      

}

