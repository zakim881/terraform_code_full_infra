variable "rg_names" {
    type = map(string)
}
variable "vnet" {
    
}
variable "subnet"{

}
variable "nic"{
    
}
variable "virtual_machine"{
    
}
variable "nsg" {
    
}
variable "pip"{
    
}
variable "zakisloadbalancer" {}
variable "backend_pool" {}
variable "lb_probe" {}
variable "lb_rule" {}
variable "bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    pip_key             = string
  }))
}

variable "bastion_subnet" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
