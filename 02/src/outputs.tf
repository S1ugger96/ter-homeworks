output "vms_info" {
  description = "Instance name, external IP and FQDN for each VM"
  value = {
    for vm in [yandex_compute_instance.platform, yandex_compute_instance.platform_db] :
    vm.name => {
      instance_name = vm.name
      external_ip   = vm.network_interface[0].nat_ip_address
      fqdn          = vm.fqdn
    }
  }
}
