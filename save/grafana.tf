provider "grafana" {
    url = "http://localhost:3000"
    auth = "admin:password"
}

resource "grafana_data_source" "influxdb" {
    type = "influxdb"
    name = "influxdb_connection"
    url = "http://cloud.fredericpinaud.fr:8086/"
    database_name = "digitalocean"
}

resource "grafana_organization" "org" {
    name = "Grafana Orgnization"
    admin_user = "fred"
    create_users = true
    admins = [
        "fred@admin.com:password"
    ]
}