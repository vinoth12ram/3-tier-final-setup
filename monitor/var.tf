variable "resource_group" {}
# variable "location" {} ## Commented After validate code
# variable "web_vm_id" {} ## Commented After validate code
# variable "app_vm_id" {} ## Commented After validate code
variable "email_id" {}
variable "vm_count" {
  description = "The number of Windows VM instances to create."
}