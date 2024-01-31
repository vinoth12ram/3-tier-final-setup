env                       = "dev"
vnetcidr                  = "192.168.0.0/16"
websubnetcidr             = "192.168.1.0/24"
appsubnetcidr             = "192.168.2.0/24"
dbsubnetcidr              = "192.168.3.0/24"
#vnet_name                 = "dojo_vnet"     # Commented after validate code
#web_subnet_name           = "dojo_web_snet" # Commented after validate code
#app_subnet_name           = "dojo_app_snet" # Commented after validate code
#db_subnet_name            = "dojo_db_snet"  # Commented after validate code
#pip_name_db               = "dojo_db_pip"  # Added after validate code
#pip_name_app              = "dojo_app_pip" # Added after validate code
#nat_gw_app                = "dojo_nat_gw_app" # Added after validate code
#nat_gw_db                 = "dojo_nat_gw_db" # Added after validate code

vm_count                   = 2
#web_availibility_set      = "dojo_web_set" # Commented after validate code
#web_network_interface     = "dojo_web_net" # Commented after validate code
#web_win_vm                = "dojo_web_win" # Commented after validate code
#app_availibility_set      = "dojo_app_set" # Commented after validate code
#app_network_interface     = "dojo_app_net" # Commented after validate code
#app_win_vm                = "dojo_app_win" # Commented after validate code
#web_host_name             = "dojowebserver" # Commented after validate code
#web_username              = "dojo_web_user" # Commented after validate code
#web_os_password           = "@Webuser1"     # Commented after validate code
#app_host_name             = "dojoappserver" # Commented after validate code
#app_username              = "dojo_app_user" # Commented after validate code
#app_os_password           = "@Appuser1"     # Commented after validate code
#ipconfig_app_name         = "ip_conf_app"   # Commented after validate code
#ipconfig_web_name         = "ip_conf_web"   # Commented after validate code
vm_size                   = "Standard_D2s_v4"
os_type                   = "2022-Datacenter"

#web-nsg-name              = "dojo-web-nsg"  # Commented after validate code
#app-nsg-name              = "dojo-app-nsg"  # Commented after validate code
#db-nsg-name               = "dojo-db-nsg"   # Commented after validate code
 
#db_name                   = "dojo-db"                 # Commented after validate code
#primary_database          = "sql-primary-database"    # Commented after validate code
#primary_database_admin    = "sqladmin"                # Commented after validate code
#primary_database_password = "pa$$w0rd"                # Commented after validate code
primary_database_version  = "22.0"

#clientcidr                = "121.16.0.0/24"           # Required for Manual setup
#lb_name                   = "dojo_lb"                 # Commented after validate code
#lb_pip_name               = "dojo_lb_pip"             # Commented after validate code 
#backend_addr_pool         = "dojo_backend_addr_pool"  # Commented after validate code

#vpn_pip_name              = "dojo_vpn_pip"            # Required for Manual setup
#vir_nw_gw                 = "dojo_vir_nw_gw"          # Required for Manual setup

email_id                   = "vinoth.ramesh@valuemomentum.com"