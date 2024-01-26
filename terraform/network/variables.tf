# variables.tf
variable "folder_id" {
  type = string
}
variable "cloud_id" {
  type = string
}
variable "sa_key_file" {
  type = string
}
variable "zone" {
  type = string
}
variable "allowed_ports" {
  description = "List of allowed ports for the security group stats"
  type        = list(string)
  default     = []
}
variable "allowed_statport" {
  description = "Port for HAproxy stat and other ports"
  type        = list(string)
  default     = []
}
variable "allowed_stat_ip" {
  type        = list(string)
  description = "List of allowed ip for the security group stats"
}