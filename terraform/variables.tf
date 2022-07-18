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
