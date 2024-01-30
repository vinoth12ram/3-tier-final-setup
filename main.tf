terraform {
 required_providers {
   azurerm = {
     source = "hashicorp/azurerm"
   }
 }
 backend "azurerm" {
      resource_group_name  = "DOJO"
      storage_account_name = "dojostorage1"
      container_name       = "dojo"
      key                  = "infra.terraform.tfstate"    
  }
}


provider "azurerm" {
  features {}
}

# Existing Resource Group
data "azurerm_resource_group" "this" {
  name = "DOJO"
}

module "networking" {
  source          = "./networking"
  location        = data.azurerm_resource_group.this.location
  resource_group  = data.azurerm_resource_group.this.name
  vnetcidr        = var.vnetcidr
  websubnetcidr   = var.websubnetcidr
  appsubnetcidr   = var.appsubnetcidr
  dbsubnetcidr    = var.dbsubnetcidr
  vnet_name       = "${var.env}-${var.vnet_name}"
  web_subnet_name = "${var.env}-${var.web_subnet_name}"
  app_subnet_name = "${var.env}-${var.app_subnet_name}"
  db_subnet_name  = "${var.env}-${var.db_subnet_name}"
  pip_name_app = "${var.env}-${var.pip_name_app}" #Added After validate code
  pip_name_db ="${var.env}-${var.pip_name_db}"    #Added After validate code
  nat_gw_app = "${var.env}-${var.nat_gw_app}"     #Added After validate code
  nat_gw_db = "${var.env}-${var.nat_gw_db}"       #Added After validate code
}

module "compute" {
  source = "./compute"
  location        = data.azurerm_resource_group.this.location
  resource_group  = data.azurerm_resource_group.this.name
  vm_count              = "${var.vm_count}"
  web_availibility_set  = "${var.env}-${var.web_availibility_set}"
  web_network_interface = "${var.env}-${var.web_network_interface}"
  web_win_vm            = "${var.env}-${var.web_win_vm}"
  app_availibility_set  = "${var.env}-${var.app_availibility_set}"
  app_network_interface = "${var.env}-${var.app_network_interface}"
  app_win_vm            = "${var.env}-${var.app_win_vm}"
  web_subnet_id         = module.networking.web_subnet_id
  app_subnet_id         = module.networking.app_subnet_id
  #web_host_name         = "${var.env}-${var.web_host_name}"
  web_username          = "${var.env}-${var.web_username}"
  web_os_password       = var.web_os_password
  #app_host_name         = "${var.env}-${var.app_host_name}"
  app_username          = "${var.env}-${var.app_username}"
  app_os_password       = var.app_os_password
  ipconfig_app_name     = "${var.env}-${var.ipconfig_app_name}"
  ipconfig_web_name     = "${var.env}-${var.ipconfig_web_name}"
  vm_size               = var.vm_size
  os_type               = var.os_type
  #web_net_id = module.compute.web_net_id
  #app_net_id = module.compute.app_net_id
}

module "securitygroup" {
  source = "./securitygroup"
  location        = data.azurerm_resource_group.this.location
  resource_group  = data.azurerm_resource_group.this.name
  web-nsg-name = "${var.env}-${var.web-nsg-name}"
  app-nsg-name = "${var.env}-${var.app-nsg-name}"
  db-nsg-name = "${var.env}-${var.db-nsg-name}"
  web_subnet_id  = module.networking.web_subnet_id     #Added After validate code
  app_subnet_id  = module.networking.app_subnet_id     #Added After validate code
  db_subnet_id   = module.networking.db_subnet_id      #Added After validate code

}

module "database" {
  source                    = "./database"
  location        = data.azurerm_resource_group.this.location
  resource_group  = data.azurerm_resource_group.this.name
  db_name                   = "${var.env}-${var.db_name}"
  primary_database          = "${var.env}-${var.primary_database}"
  primary_database_version  = var.primary_database_version
  primary_database_admin    = var.primary_database_admin
  primary_database_password = var.primary_database_password
}

module "loadbalancer" {
  source = "./loadbalancer"
  lb_pip_name = "${var.env}-${var.lb_pip_name}"
  lb_name = "${var.env}-${var.lb_name}"
  backend_addr_pool = "${var.env}-${var.backend_addr_pool}"
  web_net_id = module.compute.web_net_id
  location        = data.azurerm_resource_group.this.location
  resource_group  = data.azurerm_resource_group.this.name
}

module "monitor" {
  source = "./monitor"
  vm_count   = "${var.vm_count}"
  #count     = "${var.win_vm_count}"                   #Added After validate code
  web_vm_id = module.compute.web_vm_id #Changed After validate code
  app_vm_id = module.compute.app_vm_id #Changed After validate code
  resource_group  = data.azurerm_resource_group.this.name
  email_id = var.email_id
}

#module "vpn" {
#  source = "./vpn"
#  vpn_pip_name = var.vpn_pip_name
#  vir_nw_gw = var.vir_nw_gw
#  location        = data.azurerm_resource_group.this.location
#  resource_group  = data.azurerm_resource_group.this.name
#  vpn_client_root_cert_content = local.root_cert
#}

#locals {
#  root_cert = module.vpn.rootcert
#}
