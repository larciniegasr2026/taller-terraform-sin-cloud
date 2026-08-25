terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Genera un nombre de equipo aleatorio (no requiere ninguna cuenta en la nube)
resource "random_pet" "equipo" {
  length    = 2
  separator = "-"
}

# Crea un archivo local usando el nombre generado arriba,
# demostrando cómo un recurso puede depender de otro
resource "local_file" "bienvenida" {
  filename = "${path.module}/output/bienvenida.txt"
  content  = <<-EOT
    ¡Hola, ${var.participante}!

    Tu infraestructura de práctica fue creada con éxito.
    Nombre de equipo generado automáticamente: ${random_pet.equipo.id}

    Este archivo fue creado por Terraform sin necesidad de una cuenta en la nube.
  EOT
}
