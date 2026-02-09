output "yandex_vpc_network" {
  value = data.yandex_vpc_network.default
  description = "Yandex.Cloud Network info"
}

output "yandex_vpc_subnets" {
  value       =  data.yandex_vpc_subnet.default
  description = "Yandex.Cloud Subnets map"
}