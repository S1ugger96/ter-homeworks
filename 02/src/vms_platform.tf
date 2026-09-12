###vm web vars
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for web VM"
}
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Web VM name"
}
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Web VM platform id"
}
#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "Web VM vCPU cores"
#}
#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "Web VM RAM, GB"
#}
#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 5
#  description = "Web VM vCPU performance level"
#}

###vm db vars
variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for db VM"
}
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "DB VM name"
}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "DB VM platform id"
}
#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "DB VM vCPU cores"
#}
#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "DB VM RAM, GB"
#}
#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "DB VM vCPU performance level"
#}
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "DB VM availability zone"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  description = "Compute resources config per VM role"
}

variable "metadata" {
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
  description = "Common metadata for all VMs (ssh-keys added per VM via merge)"
}
