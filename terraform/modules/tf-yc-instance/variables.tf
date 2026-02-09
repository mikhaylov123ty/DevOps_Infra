variable "vm_instance"{
  type = string
  default = "practice1"
  nullable = false
  description = "Имя инстанса виртуальной машины"
}

variable "student_id"{
  type = string
  description = "Идентификатор студента. Наследуется из корневого модуля"
}

variable "zone" {
  type = string
  description = "Идентификатор зоны. Наследуется из корневого модуля"
}

variable "platform_id" {
  type = string
  default = "standard-v3"
  description = "Платформа ВМ"
}

variable "cpu_cores"{
  type = number
  default = 2
  description = "Количество ядер процессора"
}

variable "memory"{
  type = number
  default = 2
  description = "Количество оперативной памяти в ГБ"
}

variable "image_id" {
  type = string
  default = "fd80qm01ah03dkqb14lc"
  nullable = false
  description = "Образ операционной системы для новой виртуальной машины"
}

variable "disk_size"{
  type = number
  default = 30
  description = "Размер диска в ГБ"
}

variable "subnet_id" {
  nullable = false
  description = "Идентификатор подсети, к которой будет подключена ВМ"
}

variable "nat"{
  type = bool
  default = true
  description = "Флаг интерфейса NAT"
}

variable "user_data_file"{
  type = string
  default = "./scripts/cloud-init.yaml"
  nullable = false
  description = "Путь к файлу скрипта cloud-init"
}

variable "ssh_auth_key_file" {
  type = string
  nullable = false
}


variable "scheduling_policy"{
  type = bool
  default = true
  description = "Политика прерывания ВМ"
}
