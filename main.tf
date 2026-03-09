terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx"
  keep_locally = true
}

resource "docker_container" "server" {
  name = "Mon_serveur_web"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 9000
  }
}