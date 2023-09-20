provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfstate10561"
    container_name       = "tfstate"
    key                  = "efit-aks-cluster.tfstate"
  }
}

resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-aks-rg"
  location = var.location

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  tags = var.tags
}
