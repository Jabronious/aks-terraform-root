variable "prefix" {
  description = "Descriptive name for your resources"
}

variable "location" {
  description = "Location the cluster will be located in"
  default     = "eastus"
}

variable "tags" {
  description = "Tags for your resources"
  default = {
    type = "k8s"
  }
}

# Azure GUIDS
variable "subscription_id" {
}
variable "client_id" {
}
variable "client_secret" {
}
variable "tenant_id" {
}
