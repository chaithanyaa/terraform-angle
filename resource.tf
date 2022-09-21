# Create a new Resource Group

resource "azurerm_resource_group" "group" {
  name     = "az-nginx-anglerg"
  location = var.location
}

# Create an App Service Plan with Linux
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "az-nginx-anglerg-plan"
  location            =  var.location
  resource_group_name = "az-nginx-anglerg"
  reserved            = true

  # Define Linux as Host OS
  kind = "Linux"

  # Choose size
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Azure Web App for Containers in that App Service Plan

resource "azurerm_app_service" "angle_nginx" {
  name                = "az-nginx-angle-dockerapp"
  location            = var.location
  resource_group_name = azurerm_resource_group.group.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  #  Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|nginx:latest"
    always_on        = "true"
    ip_restriction =[
      {
       ip_address = "80.220.90.56/32"
       virtual_network_subnet_id = null
       headers = []
       service_tag = null
       action     = "Allow"
       priority   = 100
       name       = "MYIP"
      },
      {
       ip_address = "212.146.63.50/32"
       virtual_network_subnet_id = null
       headers = []
       service_tag = null
       action     = "Allow"
       priority   = 101
       name       = "ngleip"
      },
      {
      ip_address = "0.0.0.0/0"
       virtual_network_subnet_id = null
       headers = []
       service_tag = null
       action     = "Deny"
       priority   = 102
       name       = "Block"
      }
      ] 
      }
  identity {
    type = "SystemAssigned"
  }
}