###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to public ssh key for VMs"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for web VMs"
}

variable "vm_web_count" {
  type        = number
  default     = 2
  description = "Number of web VMs"
}

variable "vm_web_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
  description = "Resources for web VMs"
}

variable "each_vm" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    disk_volume   = number
    core_fraction = number
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 2
      ram           = 2
      disk_volume   = 20
      core_fraction = 20
    },
    {
      vm_name       = "replica"
      cpu           = 4
      ram           = 4
      disk_volume   = 30
      core_fraction = 20
    }
  ]
  description = "Database VMs parameters"
}

variable "storage_disk_count" {
  type        = number
  default     = 3
  description = "Number of secondary disks"
}

variable "storage_disk_size" {
  type        = number
  default     = 1
  description = "Secondary disk size in GB"
}
