resource "azurerm_monitor_action_group" "email-alert" {
  name                = "email-alert"
  resource_group_name = var.resource_group
  short_name          = "email"

  email_receiver {
    name                    = "sendtocloudops"
    email_address           = var.email_id
    use_common_alert_schema = true
  }

}

resource "azurerm_monitor_metric_alert" "cpu-alert-web-vms" {
  count               = var.vm_count
  name                = "cpu-metricalert-webvms"
  resource_group_name = var.resource_group
  scopes              = [var.web_vm_id[count.index]]
  description         = "Action will be triggered when CPU Threshold is greater than 90."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90

  }
  action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}

resource "azurerm_monitor_metric_alert" "cpu-alert-app-vms" {
  count               = var.vm_count
  name                = "cpu-metricalert-appvms"
  resource_group_name = var.resource_group
  scopes              = [var.app_vm_id[count.index]]
  description         = "Action will be triggered when CPU Threshold is greater than 90."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90

  }

    action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}

resource "azurerm_monitor_metric_alert" "network-alert-web-vms" {
  count               = var.vm_count
  name                = "network-metricalert-webvms"
  resource_group_name = var.resource_group
  scopes              = [var.web_vm_id[count.index]]
  description         = "Action will be triggered when Packet Threshold is greater than 100000."

  criteria {
    metric_namespace = "Microsoft.Network/networkInterfaces"
    metric_name      = "Network In"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 100000

  }
   action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }


}

resource "azurerm_monitor_metric_alert" "network-alert-app-vms" {
  count               = var.vm_count
  name                = "network-metricalert-appvms"
  resource_group_name = var.resource_group
  scopes              = [var.app_vm_id[count.index]]
  description         = "Action will be triggered when Packet Threshold is greater than 100000."

  criteria {
    
      metric_namespace = "Microsoft.Network/networkInterfaces"
      metric_name      = "Network In"
      aggregation      = "Total"
      operator         = "GreaterThan"
      threshold        = 100000

  }
 
   action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}