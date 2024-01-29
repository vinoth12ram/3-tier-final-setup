env                       = "dev"
vnetcidr                  = "192.168.0.0/16"
websubnetcidr             = "192.168.1.0/24"
appsubnetcidr             = "192.168.2.0/24"
dbsubnetcidr              = "192.168.3.0/24"
vnet_name                 = "dojo_vnet"
web_subnet_name           = "dojo_web_snet"
app_subnet_name           = "dojo_app_snet"
db_subnet_name            = "dojo_db_snet"
pip_name_db               = "dojo_db_pip"  # Added after validate code
pip_name_app              = "dojo_app_pip" # Added after validate code
nat_gw_app                = "dojo_nat_gw_app" # Added after validate code
nat_gw_db                 = "dojo_nat_gw_db" # Added after validate code

win_vm_count              = 2
web_availibility_set      = "dojo_web_set"
web_network_interface     = "dojo_web_net"
web_win_vm                = "dojo_web_win"
app_availibility_set      = "dojo_app_set"
app_network_interface     = "dojo_app_net"
app_win_vm                = "dojo_app_win"
web_host_name             = "dojowebserver"
web_username              = "dojo_web_user"
web_os_password           = "@Webuser1"
app_host_name             = "dojoappserver"
app_username              = "dojo_app_user"
app_os_password           = "@Appuser1"
ipconfig_app_name         = "ip_conf_app"
ipconfig_web_name         = "ip_conf_web"
vm_size                   = "Standard_D2s_v4"
os_type                   = "2022-Datacenter"

web-nsg-name              = "dojo-web-nsg"
app-nsg-name              = "dojo-app-nsg"
db-nsg-name               = "dojo-db-nsg"

db_name                   = "dojo-db"
primary_database          = "sql-primary-database"
primary_database_admin    = "sqladmin"
primary_database_password = "pa$$w0rd"
primary_database_version  = "22.0"

#clientcidr                = "121.16.0.0/24"
lb_name                   = "dojo_lb"
lb_pip_name               = "dojo_lb_pip"
backend_addr_pool         = "dojo_backend_addr_pool"

#vpn_pip_name              = "dojo_vpn_pip"
#vir_nw_gw                 = "dojo_vir_nw_gw"

email_id                   = "vinoth.ramesh@valuemomentum.com"