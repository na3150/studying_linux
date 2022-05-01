# Create Network Security Group and rule
resource "azurerm_network_security_group" "bastion-sg" {
  name                = "bastion-sg"
  location            = azurerm_resource_group.wp-rg.location
  resource_group_name = azurerm_resource_group.wp-rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "1.236.233.38/32"
    destination_address_prefix = "*"
  }
}

#Wordpress VM sg HTTP
resource "azurerm_network_security_group" "wp-sg" {
  name                = "wp-sg"
  location            = azurerm_resource_group.wp-rg.location
  resource_group_name = azurerm_resource_group.wp-rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#LB sg
resource "azurerm_network_security_group" "wp-lb-sg" {
  name                = "wp-lb-sg"
  location            = azurerm_resource_group.wp-rg.location
  resource_group_name = azurerm_resource_group.wp-rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}