module "yandex_cloud_vm_instance" {
  source = "./modules/tf-yc-instance"
  zone = var.zone
  subnet_id = module.yandex_cloud_network.yandex_vpc_subnets[var.zone].id
  ssh_auth_key_file = var.ssh_auth_key_file
  student_id = var.student_id
}

module "yandex_cloud_network" {
  source = "./modules/tf-yc-network"
}