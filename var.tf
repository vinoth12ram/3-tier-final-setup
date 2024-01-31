variable "location" {
    description = "Location"
    default = ""
}

variable "resource_group" {
    description = "Resource group name"
    default = ""
}

variable "env" {
    default ="staging"
    type = string
}

variable "vm_count" {
  description = "The number of Windows VM instances to create."
  default = 3
}

variable "vnetcidr" {
    default ="10.0.0.0/16"
    type = string
}
variable "websubnetcidr" {
    default = "10.0.1.0/24"
    type = string
}
variable "appsubnetcidr" {
    default ="10.0.2.0/24"
    type = string
}
variable "dbsubnetcidr" {
    default ="10.0.3.0/24"
    type = string
}

variable "vnet_name" {
    default ="dojo-vnet"
    type = string
}
variable "web_subnet_name" {
    default ="dojo-web-snet"
    type = string
}
variable "app_subnet_name" {
    default ="dojo-app-snet"
    type = string
}
variable "db_subnet_name" {
    default ="dojo-db-snet"
    type = string
}

variable "pip_name_app" {
    default ="dojo-pip-app"
    type = string
}
variable "pip_name_db" {
    default ="dojo-pip-db"
    type = string
}
variable "nat_gw_app" {
    default ="dojo_nat_gw_app"
    type = string
}
variable "nat_gw_db" {
    default ="dojo_nat_gw_db"
    type = string
}

variable "web_net_id" {
  description = "Id of web interface in the network"
  type = string
  default = ""
}

#variable "app_net_id" {
#  description = "Id of app interface in the network"
#  type = string
#  default = ""
#}

variable "web_subnet_id" {
  description = "Id of web vms subnet"
  type = string
  default = ""
}
variable "app_subnet_id" {
  description = "Id of app vms subnet"
  type = string
  default = ""
}

#variable "web_host_name"{}

variable "web_username" {
    default ="dojo_web_user"
    type = string
}
variable "web_os_password" {
    default ="@Webuser1"
    type = string
}
#variable "app_host_name"{}
variable "app_username" {
    default ="dojo_app_user"
    type = string
}
variable "app_os_password" {
    default ="@Appuser1"
    type = string
}
variable "web_availibility_set" {
    default ="dojo_web_set"
    type = string
}
variable "web_network_interface" {
    default ="dojo_web_net"
    type = string
}
variable "web_win_vm" {
    default ="dojo_web_win"
    type = string
}
variable "app_availibility_set" {
    default ="dojo_app_set"
    type = string
}
variable "app_network_interface" {
    default ="dojo_app_net"
    type = string
}
variable "app_win_vm" {
    default ="dojo_app_win"
    type = string
}
variable "ipconfig_app_name" {
    default ="ip_conf_app"
    type = string
}
variable "ipconfig_web_name" {
    default ="dojo_app_win"
    type = string
}
variable "vm_size" {
    default ="Standard_D2s_v4"
    type = string
}
variable "os_type" {
    default ="2019-Datacenter"
    type = string
}

variable "web-nsg-name" {
    default ="dojo-web-nsg"
    type = string
}
variable "app-nsg-name" {
    default ="dojo-app-nsg"
    type = string
}
variable "db-nsg-name" {
    default ="dojo-db-nsg"
    type = string
}
variable "primary_database" {
    default ="dojo-master-db"
    type = string
}
variable "primary_database_version" {
    default ="22.0"
    type = string
}
variable "primary_database_admin" {
    default ="sqladmin"
    type = string
}
variable "primary_database_password" {
    default ="pa$$w0rd"
    type = string
}
variable "db_name" {
    default ="dojo-db"
    type = string
}


variable "lb_name" {
    default ="dojo_lb"
    type = string
}
variable "lb_pip_name" {
    default ="dojo_lb_pip"
    type = string
}
variable "backend_addr_pool" {
    default ="dojo_backend_addr_pool"
    type = string
}


variable "web_vm_id" {
  description = "Id of web vms"
  type = string
  default = ""
}
variable "app_vm_id" {
  description = "Id of app vms"
  type = string
  default = ""
}

#variable "vpn_pip_name" {}
#variable "vir_nw_gw" {}

#variable "vpn_client_root_cert_path" {}

variable "email_id" {
    default ="vinoth.ramesh@valuemomentum.com"
    type = string
}