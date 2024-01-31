variable "resource_group" {}
variable "location" {}
variable "lb_name" {}
variable "lb_pip_name" {}
variable "backend_addr_pool" {}
variable "web_net_id" {}
# variable "app_net_id" {} ## Commented after Validate Code
variable "vm_count" {
  description = "The number of Windows VM instances to create."
}
