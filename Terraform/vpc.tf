# VPC
resource "yandex_vpc_network" "homework-network" {
  name = "homework-network"
}

# Публичная подсеть
resource "yandex_vpc_subnet" "public-subnet" {
  name           = "public"
  zone           = var.zone
  network_id     = yandex_vpc_network.homework-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Таблица маршрутизации для приватной подсети
resource "yandex_vpc_route_table" "private-rt" {
  name       = "private-rt"
  network_id = yandex_vpc_network.homework-network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

# Приватная подсеть (с привязкой таблицы маршрутов)
resource "yandex_vpc_subnet" "private-subnet" {
  name           = "private"
  zone           = var.zone
  network_id     = yandex_vpc_network.homework-network.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.private-rt.id
}
