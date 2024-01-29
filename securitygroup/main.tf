resource "azurerm_network_security_group" "web-nsg" {
  name                = var.web-nsg-name
  location            = var.location
  resource_group_name = var.resource_group
  
  security_rule {
    name                       = "rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*" #Changed After Scanning
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
  }

    security_rule {
    name                       = "rule-2"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*" #Added After Scanning
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "443"
  }
  
  security_rule {
    name                       = "rule-3"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.3.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
}
}

resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}


resource "azurerm_network_security_group" "app-nsg" {
    name = var.app-nsg-name
    location = var.location
    resource_group_name = var.resource_group

    security_rule {
        name = "rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3389"
    }
    
    security_rule {
        name = "rule-2"
        priority = 101
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3389"
    }
}

# Added after validate the code

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}

resource "azurerm_network_security_group" "db-nsg" {
    name = var.db-nsg-name  # Altered after validate the code
    location = var.location
    resource_group_name = var.resource_group

    security_rule {
        name = "rule-1"
        priority = 101
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
    
    security_rule {
        name = "rule-2"
        priority = 102
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
    
    security_rule {
        name = "rule-3"
        priority = 100
        direction = "Outbound"
        access = "Deny"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db-nsg.id
}


