variable "vm_name" {
  type = string
}
variable "resource" {
  type = string
}
variable "location" {
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
variable "nic_name" {
  
}
variable "user_name" {
  type = string
}
variable "passwd_name" {
  type = string
}
variable "keyvalt_name" {
  
}