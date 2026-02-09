resource "yandex_compute_instance" "vm-1" {
  name = "${var.vm_instance}-${var.student_id}"
  zone = var.zone
  platform_id = var.platform_id

  # Конфигурация ресурсов:
  # количество процессоров и оперативной памяти
  resources {
    cores  = var.cpu_cores
    memory = var.memory
  }

  # Загрузочный диск:
  # Образ операционной системы
  # для новой виртуальной машины
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.disk_size
    }

  }

  # Сетевой интерфейс:
  # Идентификатор подсети, к которой будет подключена ВМ
  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  # Метаданные машины:
  metadata = {
    user-data = templatefile(var.user_data_file, {
      ssh_auth_key = file(var.ssh_auth_key_file)
    })
  }

  # Политика планирования прерываемой ВМ
  scheduling_policy {
    preemptible = var.scheduling_policy
  }
}