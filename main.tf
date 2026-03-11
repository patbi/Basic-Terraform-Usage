terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.7.0"
    }
  }
}

provider "docker" {}

provider "local" {}

data "docker_image" "nginx" {
  name = "nginx"
}

data "local_file" "nginx_conf" {
  filename = abspath("./index.html")
}

resource "docker_container" "server" {
  name = "Mon_serveur_web"
  image = data.docker_image.nginx.name
  ports {
    internal = 80
    external = 9000
  }
  mounts {
    type = "bind"
    source = data.local_file.nginx_conf.filename
    target = "/usr/share/nginx/html/index.html"
  }
}