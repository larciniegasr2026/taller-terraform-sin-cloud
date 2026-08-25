output "nombre_equipo" {
  description = "Nombre de equipo generado aleatoriamente"
  value       = random_pet.equipo.id
}

output "archivo_generado" {
  description = "Ruta del archivo creado por Terraform"
  value       = local_file.bienvenida.filename
}
