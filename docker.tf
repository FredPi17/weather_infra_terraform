provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_container" "grafana" {
    image = docker_image.grafana.latest
    name = "grafana"
    ports {
        internal = 3000
        external = 3000
    }
}

resource "docker_container" "influxdb" {
    image = docker_image.influxdb.latest
    name = "influxdb"
    ports {
        internal = 8086
        external = 8086
    }
}

resource "docker_container" "chronograf" {
    image = docker_image.chronograf.latest
    name = "chronograf"
    ports {
        internal = 8888
        external = 8888
    }
}

resource "docker_container" "telegraf" {
    image = docker_image.telegraf.latest
    name = "telegraf"
    volumes {
        host_path = "./telegraf.conf"
        container_path = "/etc/telegraf/telegraf.conf:ro"
    }
    volumes {
        host_path = "/var/run/docker.sock"
        container_path = "/var/run/docker.sock:ro"
    }
}

resource "docker_image" "grafana" {
    name = "grafana/grafana"
}

resource "docker_image" "influxdb" {
    name = "influxdb"
}

resource "docker_image" "chronograf" {
    name = "chronograf"
}

resource "docker_image" "telegraf" {
    name = "telegraf"
}