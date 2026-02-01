variable "network_zones" {
  type        = set(string)
  default     = ["ru-central1-a","ru-central1-b","ru-central1-d"]
  description = "Yandex.Cloud network availability zones"
}