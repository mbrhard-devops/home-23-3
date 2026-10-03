# Вывод для Home-23-1
#output "public_vm_ip" {
#  description = "Публичный IP адрес публичной ВМ"
#  value       = yandex_compute_instance.public-vm.network_interface[0].nat_ip_address
#}

#output "private_vm_internal_ip" {
#  description = "Внутренний IP адрес приватной ВМ"
#  value       = yandex_compute_instance.private-vm.network_interface[0].ip_address
#}

# Вывод для Home-23-2
#output "instance_group_id" {
#  description = "ID группы инстансов с LAMP"
#  value       = yandex_compute_instance_group.lamp_group.id
#}

#output "load_balancer_ip" {
#  description = "Публичный IP адрес сетевого балансировщика"
#  value       = one(one(tolist(yandex_lb_network_load_balancer.lamp_nlb.listener)).external_address_spec).address
#}

# Вывод для бакета (старый, закомментирован)
#output "image_url" {
#  description = "Публичная ссылка на картинку в Object Storage"
#  value       = "https://${yandex_storage_bucket.hw23-2_bucket.bucket}.storage.yandexcloud.net/image.jpg"
#}

# Выводы для Home-23-3
# Ссылка на статический сайт
output "website_url" {
  description = "Ссылка на статический сайт в Object Storage"
  value       = "http://${yandex_storage_bucket.hw23-3_bucket.bucket}.website.yandexcloud.net"
}

# ID KMS ключа (для проверки шифрования)
output "kms_key_id" {
  description = "ID созданного KMS ключа"
  value       = yandex_kms_symmetric_key.storage_kms_key.id
}

# Имя бакета
output "bucket_name" {
  description = "Имя созданного бакета"
  value       = yandex_storage_bucket.hw23-3_bucket.bucket
}

# Ссылка на зашифрованную картинку
output "image_url" {
  description = "Ссылка на зашифрованную картинку в Object Storage"
  value       = "https://${yandex_storage_bucket.hw23-3_bucket.bucket}.storage.yandexcloud.net/image.jpg"
}