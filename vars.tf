variable "http_port" {
  description = "Port pour les requêtes HTTP"
  default = 80
}
variable "ssh_port" {
  description = "Port pour les requêtes SSH"
  default = 22
}
variable "mariadb_port" {
  description = "Port pour les connexions MariaDB"
  default = 3306
}

