locals {
  ssh_public_key = file(pathexpand(var.vms_ssh_root_key))
  ssh_metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
