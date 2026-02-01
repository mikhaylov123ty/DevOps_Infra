variable "cloud_id"{
  type = string
}

variable "folder_id"{
  type = string
}

variable "zone"{
  type = string
}

variable "student_id"{
  type = string
}

variable "ssh_auth_key_file" {
  type = string
  sensitive = true
}