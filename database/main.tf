resource "azurerm_mssql_server" "primary" {
    name = var.primary_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
    public_network_access_enabled = false # Changed After Scanning
    minimum_tls_version          = "1.2"  # Changed After Scanning
}

#Added After scanning

data "azurerm_storage_account" "this" {
  name                = "dojostorage1"
  resource_group_name = var.resource_group
}

resource "azurerm_mssql_server_extended_auditing_policy" "this" {
  server_id                               = azurerm_mssql_server.primary.id
  storage_endpoint                        = data.azurerm_storage_account.this.primary_blob_endpoint
  storage_account_access_key              = data.azurerm_storage_account.this.primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 90
}

resource "azurerm_mssql_database" "db" {
  name              = var.db_name
  server_id         = azurerm_mssql_server.primary.id
  zone_redundant    = true                # Changed After Scanning

  #  lifecycle {                           # Changed After Scanning
  #  prevent_destroy = true
  #}
}
