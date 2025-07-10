variable "vnet_name" {
  type = string
}
variable "resource" {
  type = string

}
variable "location" {
  type = string
}
variable "address_space" {
type = list(any)
}
