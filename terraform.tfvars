vnet = {
  vnet1 = {
    name                = "vnet1"
    location            = "East US"
    resource_group_name = "zakisrg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet2"
    location            = "East US"
    resource_group_name = "zakisrg"
    address_space       = ["10.1.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "zakisrg"
    virtual_network_name = "vnet1"     
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet2"
    resource_group_name  = "zakisrg"
    virtual_network_name = "vnet1"    
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nic = {
  "zaki_nic" = {
    name                = "zaki-nic"
    location            = "East US"
    resource_group_name = "zakisrg"
    ip_configuration = {
      name                          = "internal"
      subnet_key                    = "subnet1"
      private_ip_address_allocation = "Dynamic"
    }
  }
  "zakis_nic" = {
    name                = "zakis-nic"
    location            = "East US"
    resource_group_name = "zakisrg"
    ip_configuration = {
      name                          = "internal"
      subnet_key                    = "subnet2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

virtual_machine = {
  vm1 = {
    name                = "zakisvm1"
    location            = "East US"
    resource_group_name = "zakisrg"
    nic_key             = "zaki_nic"
    vm_size = "Standard_B2s"
    storage_os_disk = {
      name              = "myosdisk1"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-arm64"
      version   = "latest"
    }
    os_profile = {
      admin_username = "testadmin"
      admin_password = "Password1234!"
    }
    os_profile_linux_config = {
      disable_password_authentication = false
    }
  }
  vm2 = {
    name                = "zakisvm2"
    location            = "East US"
    resource_group_name = "zakisrg"
    nic_key             = "zakis_nic"
    vm_size = "Standard_B2s"
    storage_os_disk = {
      name              = "myosdisk2"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-arm64"
      version   = "latest"
    }
    os_profile = {
      admin_username = "testadmin"
      admin_password = "Password1234!"
    }
    os_profile_linux_config = {
      disable_password_authentication = false
    }
  }
}
nsg = {
  nsg1 = {
    name                = "zakinsg1"
    resource_group_name = "zakisrg"
    location            = "East US"
    security_rule = {
      name                       = "Allow-HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  nsg2 = {
    name                = "zakinsg2"
    resource_group_name = "zakisrg"
    location            = "East US"
    security_rule = {
      name                       = "Allow-HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
 pip = {
  pip1 = {
    name                = "zakispip"
  location            = "East US"
  resource_group_name = "zakisrg"
  allocation_method   = "Static"
  sku                 = "Standard"
 }
 pip2 = {
    name                = "zakispip1"
  location            = "East US"
  resource_group_name = "zakisrg"
  allocation_method   = "Static"
  sku                 = "Standard"
 }
 }
zakisloadbalancer = {
  lb1 = {
    name                = "zakislb"
    resource_group_name = "zakisrg"
    location            = "East US"
    pip_key             = "pip1"
  }
}

backend_pool = {
  pool1 = {
    name = "backendpool1"
  }
}

lb_probe = {
  probe1 = {
    name         = "http-probe"
    protocol     = "Http"
    port         = 80
    request_path = "/"
  }
}

lb_rule = {
  rule1 = {
    name          = "http-rule"
    protocol      = "Tcp"
    frontend_port = 80
    backend_port  = 80
  }
}
bastion_subnet = {
  "subnetting" = {
      name                 = "AzureBastionSubnet"
  resource_group_name  = "zakisrg"
  address_prefixes     = ["10.0.3.0/26"]
   virtual_network_name = "vnet1" 
}
}
bastion = {
  "bastion1" = {
    name                = "zakisbastion"
  location            = "East US"
  resource_group_name = "zakisrg"
  pip_key             = "pip2"

}
}
