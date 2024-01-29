variable "resource_group" {}
variable "location" {}
variable "vnetcidr" {}
variable "websubnetcidr" {}
variable "appsubnetcidr" {}
variable "dbsubnetcidr" {}
# variable "clientcidr" {} ## Commented After Validate Code
variable "vnet_name" {}
variable "web_subnet_name" {}
variable "app_subnet_name" {}
variable "db_subnet_name" {}
variable "pip_name_app" {}
variable "nat_gw_app" {}
variable "pip_name_db" {}
variable "nat_gw_db" {}