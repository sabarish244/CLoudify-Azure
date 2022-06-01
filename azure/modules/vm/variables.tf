variable "resource_group_name" {
  type        = string
  description = "Name of resource group to deploy instance into"
}

variable "location" {
  type        = string
  description = "Azure location to deploy instance into"
  
}

variable "subnet" {
  type        = string
  description = "Subnet to deploy instance into"
  }

variable "prefix" {
  type        = string
  description = "Prefix to place before deployed resources"
  }

variable "instance_type" {
  type        = string
  description = "Instance type/size to deploy"
  default     = "Standard_B2ms"
}

variable "client_id" {
  type        = string
  description = "Azure Client ID used for authentication"
  }

variable "client_secret" {
  type        = string
  description = "Azure Client Secret used for authentication"
  }

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID used for authentication"
  }

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID used for authentication"
  }


variable "os_disk_caching" {
type = string 
description = "os disk caching"
default = "ReadWrite"
}

variable "os_disk_managed_disk_type" {
type = string 
description = "os disk type"
default = "Standard_LRS"
}



variable "admin_username" {
  type        = string
  description = "Azure userid used for authentication"
  default     = "asgadmin"
}

variable "admin_key_public" {
  type        = string
  description = "Azure key used for authentication"
}
