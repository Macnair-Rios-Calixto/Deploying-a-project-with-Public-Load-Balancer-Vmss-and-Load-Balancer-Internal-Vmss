# Create a Variables
variable "rgname" {
  type        = string
  description = "resource grouop name"
  default     = "RG-Terraform"
}
variable "location" {
  type        = string
  description = "location name"
  default     = "eastus2"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name"
  default     = "Vnet-Terraform"
}

variable "sub_frontend" {
  type        = string
  description = "Subnet Frontend"
  default     = "Public"
}

variable "public_ip_lb_pub" {
  type        = string
  description = "Public IP Load Balancer Public"
  default     = "Pip-LB-Pub"
}

variable "lb_frontend" {
  type        = string
  description = "Load Balancer Frontend"
  default     = "LB-Frontend"
}

variable "vmss_frontend" {
  type        = string
  description = "Virtual Machine Scale Set Frontend"
  default     = "VMSS-WEB"
}

variable "sub_backend" {
  type        = string
  description = "Subnet Backend"
  default     = "Internal"
}

variable "lb_backend" {
  type        = string
  description = "Load Balancer Backend"
  default     = "LB-Backend"
}

variable "vmss_backend" {
  type        = string
  description = "Virtual Machine Scale Set Backend"
  default     = "VMSS-DB"
}













