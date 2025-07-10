#resource group

variable "resource" {
     type= string
  
}
variable "location" {
     type= string
#Vnet

}
variable "vnet_name" {
  type = string
}

variable "address_space" {
type = list(any)
}

#subnet

variable "subnet_name" {
  type = string

}

variable "address_prefixes" {
type = list(any)
}

#nsg

variable "nsg_name" {
     type = string
  
}

#public IP

variable "pip_name" {
  type = string

}

variable "allocation_method" {
  type = string
}

#NIC

variable "nic_name" {
     type = string
  
}

variable "ip_name" {
  type = string
}

variable "private_ip" {
  type = string
}

#keyvalt

variable "keyvalt_name" {
  type = string
}

#key-secret



variable "user_name" {
  type = string
}
variable "user_value" {
  type = string
}
variable "passwd_name" {
  type = string
}
variable "passwd_value" {
  type = string
}


#virtual machine

variable "vm_name" {
  type = string
}
variable "size" { #"Standard_F2"
  type = string
}
variable "disk_caching" { #ReadWrite
  type = string
}
variable "disk_stg_acc" {#Standard_LRS
  type = string
}
variable "image_publisher" {
  type = string
}
variable "image_offer" {
  type = string
}
variable "image_sku" {
  type = string
}
variable "image_version" {
  type = string
}

variable "sqlserver" {
  type = string
}
variable "database" {
  type = string
}