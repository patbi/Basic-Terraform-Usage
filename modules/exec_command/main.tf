# utiliser dans le cadre de l'environnement de dev

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = var.command
  }
}